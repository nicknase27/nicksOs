{...}: {
  imports = [
    ./env.nix
    ./keybinds.nix
    ./monitors.nix
    ./autostart.nix
    ./input.nix
  ];

  wayland = {
    windowManager = {
      hyprland = {
        enable = true;
        systemd = {
          enable = true;
        };
        settings = {
          general = {
            gaps_in = "5";
            gaps_out = "20";
            border_size = "2";
            "col.inactive_border" = "rgb(C1AEA7)";
            "col.active_border" = "rgb(FF670D)";
            resize_on_border = true;
            allow_tearing = false;
            layout = "dwindle";
          };
          decoration = {
            rounding = "10";
            rounding_power = "2";
            active_opacity = "1.0";
            inactive_opacity = "1.0";
            shadow = {
              enabled = true;
              range = "4";
              render_power = "3";
              color = "rgba(1a1a1aee)";
            };
            blur = {
              enabled = true;
              size = "3";
              passes = "1";
              vibrancy = "0.1696";
            };
          };
          animations = {
            enabled = true;
            bezier = [
              "easeOutQuint,0.23,1,0.32,1"
              "easeInOutCubic,0.65,0.05,0.36,1"
              "linear,0,0,1,1"
              "almostLinear,0.5,0.5,0.75,1.0"
              "quick,0.15,0,0.1,1"
            ];
            animation = [
              "global, 1, 10, default"
              "border, 1, 5.39, easeOutQuint"
              "windows, 1, 4.79, easeOutQuint"
              "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
              "windowsOut, 1, 1.49, linear, popin 87%"
              "fadeIn, 1, 1.73, almostLinear"
              "fadeOut, 1, 1.46, almostLinear"
              "fade, 1, 3.03, quick"
              "layers, 1, 3.81, easeOutQuint"
              "layersIn, 1, 4, easeOutQuint, fade"
              "layersOut, 1, 1.5, linear, fade"
              "fadeLayersIn, 1, 1.79, almostLinear"
              "fadeLayersOut, 1, 1.39, almostLinear"
              "workspaces, 1, 1.94, almostLinear, fade"
              "workspacesIn, 1, 1.21, almostLinear, fade"
              "workspacesOut, 1, 1.94, almostLinear, fade"
            ];
          };
          dwindle = {
            pseudotile = true;
            preserve_split = true;
          };

          master = {
            new_status = "master";
          };

          misc = {
            force_default_wallpaper = 0;
            disable_hyprland_logo = true;
          };

          xwayland = {
            force_zero_scaling = true;
          };
          windowrule = [
            "suppressevent maximize, class:.*"
            "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
            "opacity 0.0 override, class:^(xwaylandvideobridge)$"
            "noanim, class:^(xwaylandvideobridge)$"
            "noinitialfocus, class:^(xwaylandvideobridge)$"
            "maxsize 1 1, class:^(xwaylandvideobridge)$"
            "noblur, class:^(xwaylandvideobridge)$"
            "nofocus, class:^(xwaylandvideobridge)$"
          ];

          windowrulev2 = [
            "workspace special:magic, class:^(feishin)$"
            "workspace 5, class:^(vesktop)$"
            "idleinhibit fullscreen, class:^(*)$"
            "idleinhibit fullscreen, title:^(*)$"
            "idleinhibit fullscreen, fullscreen:1"
          ];
        };
      };
    };
  };
}
