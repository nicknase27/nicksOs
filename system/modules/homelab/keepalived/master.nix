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
        };

        VI_1_IPV6 = {
          state = "MASTER";
          interface = "eno1";
          virtualRouterId = 52;
          priority = 150;

          unicastSrcIp = "fda0:be70:c013:0::210";
          unicastPeers = [
            "fda0:be70:c013:0::215"
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
}
