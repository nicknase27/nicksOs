{
  config,
  pkgs,
  lib,
  agenix,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./theseus-secrets.nix

    ./profile.nix
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
    useDHCP = lib.mkForce false;
    interfaces.enp34s0 = {
      ipv4.addresses = [
        {
          address = "192.168.178.20";
          prefixLength = 24;
        }
      ];
      ipv6.addresses = [
        {
          address = "fda0:be70:c013:0::210";
          prefixLength = 64;
        }
      ];
    };
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    flake = "/home/nick/nicksOs/system#Theseus";
    dates = "weekly";
  };
}
