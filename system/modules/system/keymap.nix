{
  config,
  pkgs,
  lib,
  ...
}: {
  services.xserver = {
    xkb = {
      layout = "us";
      options = "grp:win_space_toggle";
    };
  };

  console.keyMap = "us";
}
