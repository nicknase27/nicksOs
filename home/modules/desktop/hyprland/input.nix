{...}: {
  wayland = {
    windowManager = {
      hyprland = {
        enable = true;
        settings = {
          input = {
            kb_layout = "us";
            kb_variant = "";
            kb_model = "";
            kb_options = "";
            kb_rules = "";
            follow_mouse = 1;
            sensitivity = 0;
          };

          device = [
            {
              name = "epic-mouse-v1";
              sensitivity = -0.5;
            }
          ];
        };
      };
    };
  };
}
