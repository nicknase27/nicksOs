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

    ../../modules/homelab/shared
    ../../modules/homelab/Apollo
  ];

  users.users = {
    nick = {
      packages = with pkgs; [
      ];
    };
  };

  services.getty.autologinUser = "nick";

  # Optional: disable virtual consoles you don’t need
  services.getty.helpLine = lib.mkForce "";

  environment.systemPackages = with pkgs; [
    ffmpeg
    yt-dlp
  ];

  networking = {
    hostName = "Apollo";
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    flake = "/home/nick/nicksOs/system/#Apollo";
    dates = "monthly";
  };

  services.displayManager = {
    sddm = {
      enable = lib.mkForce false;
      wayland.enable = lib.mkForce false;
    };
  };
}
