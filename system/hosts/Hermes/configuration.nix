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

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    flake = "/home/nick/nicksOs#Hermes";
    dates = "monthly";
  };

  services.displayManager = {
    sddm = {
      enable = lib.mkForce false;
      wayland.enable = lib.mkForce false;
    };
  };

  hardware.bluetooth = {
    enable = lib.mkForce true;
    powerOnBoot = lib.mkForce true;
    settings = {
      General = {
        Experimental = lib.mkForce true;
        FastConnectable = lib.mkForce true;
      };
      Policy = {
        AutoEnable = lib.mkForce true;
      };
    };
  };
}
