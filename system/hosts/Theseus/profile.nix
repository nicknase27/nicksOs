{pkgs, ...}: {
  # Host-specific configurations for Theseus, my PC
  imports = [
    ../../modules/user/apps/hyprland.nix

    ../../modules/user/apps/gaming.nix
    ../../modules/user/apps/vpn.nix
    #../../modules/user/apps/virt.nix
    #../../modules/user/apps/misc.nix

    ../../modules/system/bluetooth.nix
    ../../modules/system/displaymanager.nix

    ../../modules/homelab.nix
  ];
}
