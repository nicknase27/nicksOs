{
  config,
  pkgs,
  lib,
  agenix,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./secrets.nix
  ];

  users.users = {
    nick = {
      packages = with pkgs; [
        nicotine-plus
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    compose2nix
    cifs-utils
    vscodium
    via
  ];

  services.udev.packages = with pkgs; [
    via
  ];

  networking = {
    hostName = "Theseus";

    # Override global defaults
    networkmanager.enable = lib.mkForce false;
    useNetworkd = true;
    useDHCP = false;

    interfaces.enp34s0 = {
      ipv4.addresses = [
        {
          address = "192.168.178.20";
          prefixLength = 24;
        }
      ];
      ipv6.addresses = [
        {
          address = "fda0:be70:c013:0::20";
          prefixLength = 64;
        }
      ];
    };

    defaultGateway = {
      address = "192.168.178.1";
      interface = "enp34s0";
    };
    defaultGateway6 = {
      address = "fda0:be70:c013::36e1:a9ff:fece:9ace";
      interface = "enp34s0";
    };
  };

  # Avoid blocking rebuilds for static IP hosts
  systemd.services."systemd-networkd-wait-online".enable = lib.mkForce false;

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    flake = "/home/nick/nicksOs/system#Theseus";
    dates = "weekly";
  };
}
