{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ../modules/core.nix
  ];

  # --- Common Packages ---
  environment.systemPackages = with pkgs; [
    inputs.agenix.packages."${system}".default
    inputs.compose2nix.packages."${system}".default
    fastfetch
    starship
    neovim
    feh
    bash
    fish
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
    baobab
    bind
  ];

  system.stateVersion = "25.05";
}
