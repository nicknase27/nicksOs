{
  config,
  pkgs,
  lib,
  inputs,
  agenix,
  ...
}: {
  imports = [
    ../modules/core/default.nix
    ../modules/user/editors/neovim/default.nix
    ../modules/user/git/default.nix
    ../modules/user/shells/default.nix
  ];

  # --- User ---
  users.users.nick = {
    isNormalUser = true;
    description = "Main user";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  # --- Updates & Maintenance ---
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    gc = {
      automatic = true;
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    flake = "/home/nick/nicksOs#Theseus";
    dates = "weekly";
  };

  # --- Services ---

  services = {
    fwupd = {
      enable = true;
    };
    fstrim = {
      enable = true;
    };
  };

  # --- Common Packages ---
  environment.systemPackages = with pkgs; [
    inputs.agenix.packages."${system}".default
    fastfetch
    neovim
    feh
    vlc
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
