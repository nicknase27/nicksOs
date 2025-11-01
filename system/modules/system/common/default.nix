{...}: {
  imports = [
    # --- Components --- #
    ./components/boot.nix
    ./components/maintenance.nix
    ./components/networking.nix
    ./components/locale.nix
    ./components/user.nix
    ./components/pkgs.nix

    # --- Services --- #
    ./services/ssh.nix
    ./services/fstrim.nix
    ./services/fwupd.nix
    ./services/getty.nix
  ];

  system.stateVersion = "25.05";
}
