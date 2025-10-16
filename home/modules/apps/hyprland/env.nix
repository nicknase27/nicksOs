{...}: {
  wayland = {
    windowManager = {
      hyprland = {
        enable = true;
        settings = {
          env = [
            "XCURSOR_SIZE,26"
            "HYPRCURSOR_SIZE, 26"
          ];
        };
      };
    };
  };
}
