{pkgs, ...}: {
  # Host-specific configurations for Theseus, my PC
  imports = [
    ../../modules/profiles/desktop.nix

    ../../modules/user/apps/gaming.nix
    ../../modules/user/apps/vpn.nix
    #../../modules/user/apps/virt.nix
    #../../modules/user/apps/misc.nix

    #../../modules/homelab.nix
  ];
}
