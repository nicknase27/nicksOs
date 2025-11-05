{...}: {
  wayland = {
    windowManager = {
      hyprland = {
        enable = true;
        settings = {
          exec-once = [
            #"swww-daemon &"
            #"swww img ~/Pictures/wall/wall.png --transition-type none &"
            #"waybar &"
            #"mako &"
            #''bash -c "wl-paste --watch cliphist store &"''
          ];
        };
      };
    };
  };
}
