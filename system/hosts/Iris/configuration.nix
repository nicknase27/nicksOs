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
}
