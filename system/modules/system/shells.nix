{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
  };

  programs.fish = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    presets = [
      "bracketed-segments"
    ];
  };
}
