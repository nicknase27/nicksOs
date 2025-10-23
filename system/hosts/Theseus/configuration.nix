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
    #nameservers = [
    # "192.168.178.210"
    # "192.168.178.202"
    # "fda0:be70:c013:0:83a7:1091:7764:69bd"
    # "fda0:be70:c013:0:be24:11ff:fe84:ac69"
    #];
  };

  networking.firewall.allowedUDPPorts = [51820];
  networking.firewall.checkReversePath = false;

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    flake = "/home/nick/nicksOs/system#Theseus";
    dates = "weekly";
  };
}
