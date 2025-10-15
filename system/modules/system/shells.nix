{
  config,
  pkgs,
  lib,
  ...
}: {
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
