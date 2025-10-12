{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletions = true;
    initExtra = ''
      ${mkAliases}
      ${mkFunctions}
    '';
  };
}
