{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ../modules/core.nix
    ../modules/user/apps/dev.nix
  ];

  # --- Common Packages ---
  environment.systemPackages = with pkgs; [
    inputs.agenix.packages."${system}".default
    fastfetch
    starship
    neovim
    feh
    bash
    kitty
    btop
    stow
    zoxide
    fzf
    libnotify
    alejandra
    gzip
    p7zip
    xc
    gcc
    clang
    python3
    python3Packages.pip
    ripgrep
    tree
    imagemagick
    jetbrains-mono
    git
    mpv
  ];

  system.stateVersion = "25.05";
}
