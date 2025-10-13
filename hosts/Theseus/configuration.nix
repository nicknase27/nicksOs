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
    ../common.nix

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
    vscodium
    via
  ];

  services.udev.packages = with pkgs; [
    via
  ];
}
