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
    fastfetch
    starship
    neovim
    feh
    zsh
    bash
    kitty
    btop
    stow
    ungoogled-chromium
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
  ];

  system.stateVersion = "25.05";
}
