{
  config,
  pkgs,
  lib,
  ...
}: {
  services.xserver = {
    xkb = {
      layout = "us";
      variant = "us";
      options = "grp:win_space_toggle";
    };
  };

  console.keyMap = "us";
}
