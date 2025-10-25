{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./sync.nix
  ];

  # Declaratively manage the check_npmx.sh script in /etc/keepalived
  environment.etc."keepalived/check_npmx.sh" = {
    text = ''
      #!/run/current-system/sw/bin/bash
      # Health check for Nginx Proxy Manager on NixOS (rootless)

      # NixOS Host
      MASTER_IP="192.168.178.210"
      # Port exposed by NPMX container
      PORT=81
      # Timeout for curl
      TIMEOUT=5
      # Full path to curl in NixOS
      CURL_BIN="/run/current-system/sw/bin/curl"
      GREP_BIN="/run/current-system/sw/bin/grep"

      # Check if NPMX web UI is responding
      $CURL_BIN -s --max-time $TIMEOUT http://$MASTER_IP:$PORT/ | $GREP_BIN -q "<title>Nginx Proxy Manager</title>"
      if [ $? -eq 0 ]; then
          exit 0  # Service is healthy
      else
          exit 1  # Service down → trigger failover
      fi

    '';
    mode = "0755"; # Make the script executable
    user = "keepalived_script"; # Match Keepalived's script user
    group = "keepalived_script"; # Match Keepalived's script group
  };

  services = {
    keepalived = {
      vrrpScripts = {
        chk_npmx = {
          script = "/etc/keepalived/check_npmx.sh";
          interval = 5;
          fall = 2;
          rise = 1;
        };
      };
      vrrpInstances = {
        VI_2_IPV4 = {
          state = "MASTER";
          interface = "eno1";
          virtualRouterId = 53;
          priority = 150;

          unicastSrcIp = "192.168.178.210";
          unicastPeers = [
            "192.168.178.203"
          ];

          virtualIps = [
            {
              addr = "192.168.178.245/24";
            }
          ];

          trackScripts = [
            "chk_npmx"
          ];
        };

        VI_2_IPV6 = {
          state = "MASTER";
          interface = "eno1";
          virtualRouterId = 54;
          priority = 150;

          unicastSrcIp = "fda0:be70:c013:0::210";
          unicastPeers = [
            "fda0:be70:c013:0::203"
          ];

          virtualIps = [
            {
              addr = "fda0:be70:c013::245/64";
            }
          ];

          trackScripts = [
            "chk_npmx"
          ];
        };
      };
    };
  };
}
