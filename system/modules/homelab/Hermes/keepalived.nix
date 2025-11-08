{
  pkgs,
  config,
  lib,
  ...
}: {
  services = {
    keepalived = {
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
            "192.168.178.215"
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

          unicastSrcIp = "fda0:be70:c013:0::210%eno1";
          unicastPeers = [
            "fda0:be70:c013:0::215%eno1"
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

  environment.etc."keepalived/check_pihole.sh" = {
    text = ''
      #!/run/current-system/sw/bin/bash

      set -euo pipefail

      SERVICE="pihole-ftl.service"
      SYSTEMCTL="/run/current-system/sw/bin/systemctl"

      if "$SYSTEMCTL" is-active --quiet "$SERVICE"; then
          exit 0
      else
          exit 1
      fi
    '';
    mode = "0775";
    user = "keepalived_script";
    group = "keepalived_script";
  };
}
