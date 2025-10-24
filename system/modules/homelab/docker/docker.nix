{
  pkgs,
  lib,
  config,
  ...
}: {
  virtualisation = {
    docker = {
      enable = true;
      autoPrune.enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
      daemon = {
        settings = {
          data-root = "/data/docker";
          userland-proxy = false;
          experimental = true;
          metrics-addr = "0.0.0.0:9323";
          ipv6 = true;
          fixed-cidr-v6 = "fd00::/80";
        };
      };
    };
    oci-containers = {
      backend = "docker";
    };
  };
}
