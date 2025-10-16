{...}: {
  wayland = {
    windowManager = {
      hyprland = {
        enable = true;
        settings = {
          monitor = [
            "DP-2,2560x1440@144,0x0, 1.07, bitdepth, 10"
            "DP-3,1920x1080@120,-1920x360,1.0"
          ];

          workspace = [
            "1,monitor:DP-2, default:true"
            "2,monitor:DP-2"
            "3,monitor:DP-2"
            "4,monitor:DP-2"
            "5,monitor:DP-2"
            "6,monitor:DP-2"
            "7,monitor:DP-3"
            "8,monitor:DP-3"
            "9,monitor:DP-3"
          ];
        };
      };
    };
  };
}
