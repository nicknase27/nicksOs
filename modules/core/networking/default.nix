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
    useDHCP = true;
    dhcpcd.persistent = true;
  };
}
