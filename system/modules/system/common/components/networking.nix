{
  config,
  pkgs,
  lib,
  ...
}: {
  networking = {
    enableIPv6 = true;
    firewall = {
      enable = true;
    };

    # Use NetworkManager and DHCP by default
    networkmanager = {
      enable = true;
    };
    useDHCP = lib.mkDefault true;
    dhcpcd = {
      persistent = lib.mkDefault true;
    };
  };
}
