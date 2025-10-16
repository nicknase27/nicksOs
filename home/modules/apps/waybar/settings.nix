{...}: {
  programs.waybar = {
    enable = true;
    settings = [
      {
        height = 40;
        width = 2386;
        margin-top = 10;
        output = ["DP-2"];

        modules-left = ["hyprland/workspaces" "hyprland/window"];
        modules-center = ["custom/media"];
        modules-right = ["cpu" "memory" "pulseaudio" "clock" "custom/power" "tray"];

        tray = {
          icon-size = 20;
          spacing = 5;
        };

        "hyprland/workspaces" = {
          format = "{name}";
          persistent-workspaces = {
            "DP-1" = 6;
            "DP-2" = 3;
          };
        };

        clock = {
          timezone = "Europe/Berlin";
        };

        cpu = {
          format = "{usage}% ";
        };

        memory = {
          format = "{used:0.1f}/{total:0.1f}G";
          states = {
            critical = 90;
            warning = 75;
          };
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = [];
        };

        "custom/power" = {
          format = "⏻";
          tooltip = false;
          menu = "on-click";
          menu-file = "$HOME/.config/waybar/power_menu.xml";
        };

        "custom/media" = {
          format = "{}";
          exec = "$HOME/.config/scripts/waybar/playerctl_status.sh";
          interval = 2;
          on-click = "playerctl play-pause";
          on-click-right = "playerctl next";
          on-click-middle = "playerctl previous";
          return-type = "json";
          escape = true;
        };
      }
    ];
  };
}
