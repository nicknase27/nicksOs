{
  config,
  pkgs,
  lib,
  agenix,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./hermes-secrets.nix

    ./profile.nix
  ];

  users.users = {
    nick = {
      packages = with pkgs; [
      ];
    };
  };

  environment.systemPackages = with pkgs; [
  ];

  networking = {
    hostName = "Hermes";
    useDHCP = lib.mkForce false;
  };

  networking = {
    interfaces = {
      eno1 = {
        ipv4.addresses = [
          {
            address = "192.168.178.210";
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
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    flake = "/home/nick/nicksOs/system/#Hermes";
    dates = "monthly";
  };

  services.displayManager = {
    sddm = {
      enable = lib.mkForce false;
      wayland.enable = lib.mkForce false;
    };
  };
}
