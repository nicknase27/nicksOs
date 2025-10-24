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

      # Resolve dig dynamically
      DIG=$(command -v dig)
      if [ -z "$DIG" ]; then
          echo "$(date): Error: dig not found" >> /var/log/keepalived_check_pihole.log
          exit 1
      fi

      # Timeout for dig queries
      TIMEOUT=2

      # Log file for debugging
      LOG="/var/log/keepalived_check_pihole.log"

      # Log function
      log() {
          echo "$(date): $1" >> "$LOG"
      }

      # Check IPv4
      "$DIG" @$IPV4 pi.hole +short +time=$TIMEOUT > /dev/null 2>&1
      if [ $? -eq 0 ]; then
          log "IPv4 check passed"
          exit 0
      fi

      # Check IPv6
      "$DIG" @$IPV6 pi.hole +short +time=$TIMEOUT > /dev/null 2>&1
      if [ $? -eq 0 ]; then
          log "IPv6 check passed"
          exit 0
      fi

      # Check failed on both IPv4 and IPv6
      log "Both IPv4 and IPv6 checks failed"
      exit 1
    '';
    mode = "0755"; # Make the script executable
    user = "keepalived_script"; # Match Keepalived's script user
    group = "keepalived_script"; # Match Keepalived's script group
  };

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
      };
    };
  };
}
