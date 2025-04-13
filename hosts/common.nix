{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../modules/nixos/xdg-portal.nix
    ../modules/nixos/social.nix
    ../modules/nixos/swayfx.nix
    ../modules/nixos/vpn.nix
  ];

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

  ### Bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  ### Networking
  networking.networkmanager.enable = true;

  ### Timezone and locales
  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  ### Xorg
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  services.displayManager.autoLogin = {
    enable = true;
    user = "nick";
  };

  services.displayManager.sddm.wayland.enable = true;

  ### Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  ### Users
  users.users.nick = {
    isNormalUser = true;
    description = "nicknase";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  ### Install Packages
  environment.systemPackages = with pkgs; [
    pfetch
    gzip
    p7zip
    xc
    gcc
    clang
    python3
    python3Packages.pip
    ntfs3g
    parted
    fzf
    ripgrep
    tree
    imagemagick
    alejandra
    nixd
    jetbrains-mono
    keepassxc
    vlc
    feh
    neovim
    wget
    tmux
    grim
    slurp
    wl-clipboard
    mako
    zsh
    alacritty
    btop
    stow
    pavucontrol
    wofi
    brave
    starship
    zoxide
    fastfetch
    nautilus
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    jetbrains-mono
  ];

  ### Enable programs
  programs = {
    zsh = {
      enable = true;
    };
    git = {
      enable = true;
    };
  };

  networking.firewall.extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns'';

  ### Keyring
  services.gnome.gnome-keyring.enable = true;

  ### SSH
  services.openssh.enable = true;
}
