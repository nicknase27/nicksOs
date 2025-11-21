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
    easyeffects
    via
    media-downloader
    (ungoogled-chromium.override {enableWideVine = true;})
    ffmpeg-full
    libva
    libva-utils
  ];

  networking = {
    hostName = "Theseus";
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
