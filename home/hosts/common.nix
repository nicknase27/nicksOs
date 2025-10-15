{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../modules/apps/shell.nix
    ../modules/apps/git.nix
    ../modules/apps/fastfetch.nix
    ../modules/apps/btop.nix

    ../modules/system/fonts.nix
  ];

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  home.username = "nick";
  home.homeDirectory = "/home/nick";

  # You should not change this value
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
