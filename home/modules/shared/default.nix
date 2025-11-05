{
  config,
  pkgs,
  ...
}: {
  imports = [
  ];

  home.packages = with pkgs; [
    tmux
  ];

  home.file = {
  };

  home.sessionVariables = {
    FZF_DEFAULT_OPS = "--layout reverse --height 60% --preview 'bat -p --color always {}'";
  };

  home.username = "nick";
  home.homeDirectory = "/home/nick";

  # You should not change this value
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
