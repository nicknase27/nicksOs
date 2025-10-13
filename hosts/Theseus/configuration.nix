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
    ../common.nix

    ../../modules/user/wm/hyprland.nix

    ../../modules/user/apps/dev.nix
    ../../modules/user/apps/media.nix
    ../../modules/user/apps/web.nix
    ../../modules/user/apps/utils.nix
    ../../modules/user/apps/vpn.nix

    #../../modules/user/apps/misc.nix
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
