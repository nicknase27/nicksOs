{
  pkgs,
  config,
  lib,
  ...
}: {
  # Declaratively manage the check_pihole.sh script in /etc/keepalived
  environment.etc."keepalived/check_pihole.sh" = {
    text = ''
      #!/run/current-system/sw/bin/bash
      # Health check for Pi-hole FTL (DNS service)

      # Define the IPs to check
      IPV4="127.0.0.1"
      IPV6="::1"

      # Timeout for dig queries
      TIMEOUT=2

      # Check IPv4
      /run/current-system/sw/bin/dig @$IPV4 pi.hole +short +time=$TIMEOUT > /dev/null 2>&1
      if [ $? -eq 0 ]; then
          exit 0
      fi

      # Check IPv6
      /run/current-system/sw/bin/dig @$IPV6 pi.hole +short +time=$TIMEOUT > /dev/null 2>&1
      if [ $? -eq 0 ]; then
          exit 0
      fi

      exit 1
    '';
    mode = "0755"; # Make the script executable
    user = "keepalived_script"; # Match Keepalived's script user
    group = "keepalived_script"; # Match Keepalived's script group
  };

  # Declaratively manage the check_npmx.sh script in /etc/keepalived
  environment.etc."keepalived/check_npmx.sh" = {
    text = ''
      #!/run/current-system/sw/bin/bash
      DOCKER_BIN="/run/current-system/sw/bin/docker"
      CONTAINER_NAME="nginx-proxy-manager-app"

      $DOCKER_BIN inspect -f '{{.State.Running}}' $CONTAINER_NAME 2>/dev/null | grep -q true
      if [ $? -eq 0 ]; then
          exit 0
      else
          exit 1
      fi

    '';
    mode = "0755"; # Make the script executable
    user = "keepalived_script"; # Match Keepalived's script user
    group = "keepalived_script"; # Match Keepalived's script group
  };

  users.users."keepalived_script".extraGroups = ["docker"];

  services = {
    keepalived = {
      enable = true;
      openFirewall = true;
      extraGlobalDefs = ''
        router_id HOST1
        enable_script_security
      '';
      vrrpScripts = {
        chk_pihole = {
          script = "/etc/keepalived/check_pihole.sh";
          interval = 5;
          fall = 2;
          rise = 1;
        };
        chk_npmx = {
          script = "/etc/keepalived/check_npmx.sh";
          interval = 5;
          fall = 2;
          rise = 1;
        };
      };
      vrrpInstances = {
        VI_1_IPV4 = {
          state = "MASTER";
          interface = "eno1";
          virtualRouterId = 51;
          priority = 150;

          unicastSrcIp = "192.168.178.210";
          unicastPeers = [
            "192.168.178.202"
          ];

          virtualIps = [
            {
              addr = "192.168.178.250/24";
            }
          ];

          trackScripts = [
            "chk_pihole"
          ];
        };

        VI_1_IPV6 = {
          state = "MASTER";
          interface = "eno1";
          virtualRouterId = 52;
          priority = 150;

          unicastSrcIp = "fda0:be70:c013:0::210";
          unicastPeers = [
            "fda0:be70:c013:0::202"
          ];

          virtualIps = [
            {
              addr = "fda0:be70:c013::250/64";
            }
          ];

          trackScripts = [
            "chk_pihole"
          ];
        };

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
