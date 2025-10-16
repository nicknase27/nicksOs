{...}: {
  services = {
    mako = {
      enable = true;
      settings = {
        # Colors

        background-color = "#18181B";
        border-color = "#88c0d0";
        # Sizes

        width = 300;
        height = 110;
        border-size = 2;
        border-radius = 15;
        # Timeouts

        default-timeout = 5000;
        ignore-timeout = false;
        font = "JetBrainsMono Nerd Font 12";

        # Misc
        sort = "-time";
        layer = "overlay";
        icons = 0;

        # Categories
        "urgency=low" = {
          border-color = "#cccccc";
        };
        "urgency=normal" = {
          border-color = "#FF560D";
        };
        "urgency=high" = {
          border-color = "#EF4444";
          default-timeout = 0;
        };
        "category=mpd" = {
          default-timeout = 2000;
          group-by = "category";
        };
      };
    };
  };
}
