{pkgs, ...}: {
  imports = [
    ../../modules/user/wm/hyprland.nix

    ../../modules/user/apps/dev.nix
    ../../modules/user/apps/media.nix
    ../../modules/user/apps/web.nix
    ../../modules/user/apps/utils.nix
    ../../modules/user/apps/vpn.nix
    #../../modules/user/apps/misc.nix
  ];
}
