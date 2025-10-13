{pkgs, ...}: {
  # User-specific configurations for Theseus, including apps and window manager
  imports = [
    ../../modules/user/wm/hyprland.nix

    ../../modules/user/apps/media.nix
    ../../modules/user/apps/gaming.nix
    ../../modules/user/apps/utils.nix
    ../../modules/user/apps/vpn.nix
    #../../modules/user/apps/virt.nix
    #../../modules/user/apps/misc.nix

    ../../modules/system/services/homelab.nix
  ];
}
