{...}: {
  imports = [
    # --- Components --- #
    ./components/audio.nix
    ./components/bluetooth.nix
    ./components/displaymanager.nix
    ./components/fonts.nix
    ./components/desktop.nix
    ./components/gaming.nix
    ./components/virt.nix
    ./components/tools.nix

    # --- Services --- #
  ];
}
