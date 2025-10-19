{
  config,
  pkgs,
  lib,
  agenix,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disko.nix
    ./profile.nix
    ../common.nix
  ];

  users.users = {
    nick = {
      packages = with pkgs; [
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    curl
    gitMinimal
    neovim
  ];

  networking = {
    hostName = "Iris";
    useDHCP = lib.mkForce false;
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    flake = "/home/nick/nicksOs/system#Iris";
    dates = "monthly";
  };

  users.users.root = {
    openssh = {
      authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJwouafzGDRGeMJQbm9ME/1CSkXicdL7TthJjWkhyLYd nick@Theseus"
      ];
    };
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no"; # OR "no" for strict denial
    };
  };

  hardware.bluetooth = {
    enable = lib.mkForce false;
    powerOnBoot = lib.mkForce false;
    settings = {
      General = {
        Experimental = lib.mkForce false;
        FastConnectable = lib.mkForce false;
      };
      Policy = {
        AutoEnable = lib.mkForce false;
      };
    };
  };
}
