{
  config,
  pkgs,
  lib,
  ...
}: {
  ### Networking

  networking = {
    networkmanager.enable = true;
    enableIPv6 = true;
    useDHCP = lib.mkDefault true;
    dhcpcd.persistent = true;
    firewall = {
      enable = true;
    };
  };
}
