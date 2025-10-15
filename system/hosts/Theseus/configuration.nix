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
    nameservers = [
      "192.168.178.202"
      "fe80::be24:11ff:fe84:ac69"
    ];
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    flake = "/home/nick/nicksOs#Theseus";
    dates = "weekly";
  };
}
