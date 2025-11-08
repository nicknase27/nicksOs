{
  pkgs,
  config,
  lib,
  ...
}: {
  services = {
    keepalived = {
      vrrpInstances = {
        VI_1_IPV4 = {
          state = "BACKUP";
          interface = "eno1";
          virtualRouterId = 51;
          priority = 100;

          unicastSrcIp = "192.168.178.215";
          unicastPeers = [
            "192.168.178.210"
          ];

          virtualIps = [
            {
              addr = "192.168.178.250/24";
            }
          ];
        };

        VI_1_IPV6 = {
          state = "BACKUP";
          interface = "eno1";
          virtualRouterId = 52;
          priority = 100;

          unicastSrcIp = "fda0:be70:c013:0::215%eno1";
          unicastPeers = [
            "fda0:be70:c013:0::210%eno1"
          ];

          virtualIps = [
            {
              addr = "fda0:be70:c013::250/64";
            }
          ];
        };
      };
    };
  };

  # systemd.services.vip-watcher = {
  #   description = "Watch Keepalived VIP and control critical services";
  #   serviceConfig = {
  #     Type = "oneshot";
  #     ExecStart = pkgs.writeShellScript "vip-watcher.sh" ''
  #       #!/run/current-system/sw/bin/bash
  #       if /run/current-system/sw/bin/ip addr show eno1 | /run/current-system/sw/bin/grep -q "192.168.178.250"; then
  #         echo "VIP 192.168.178.250 is present. Ensuring pihole is started..."
  #         /run/current-system/sw/bin/systemctl start pihole-ftl.service
  #         /run/current-system/sw/bin/systemctl start traefik.service
  #       else
  #         echo "VIP 192.168.178.250 is absent. Ensuring pihole is stopped..."
  #         /run/current-system/sw/bin/systemctl stop pihole-ftl.service
  #         /run/current-system/sw/bin/systemctl stop traefik.service
  #       fi
  #     '';
  #   };
  # };
  #
  # # Run the watcher every 5 seconds
  # systemd.timers.vip-watcher = {
  #   description = "Timer for VIP watcher";
  #   wantedBy = ["timers.target"];
  #   timerConfig = {
  #     OnBootSec = "5s";
  #     OnUnitActiveSec = "5s";
  #   };
  # };
}
