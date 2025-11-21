{lib, ...}: {
  programs = {
    kitty = {
      enable = true;
      settings = {
        # Font
        font_family = lib.mkForce "JetBrainsMono Nerd Font";
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
        font_size = "13.0";
        adjust_line_height = 0;
        adjust_line_width = 0;
        # Window opacity
        background_opacity = lib.mkForce "0.9";
        # Disable close confirmation
        confirm_os_window_close = 0;
        # Cursor
        cursor_shape = "beam";
        cursor_blink_interval = "0.5";
        # Scrollback
        scrollback_lines = "10000";
        enable_scrollback_pasting = true;
        # Smooth scroll
        mouse_hide_wait = 2;
        wheel_scroll_multiplier = "3.0";
        # Ligatures
        enable_ligatures = "always";
        # Window padding
        window_padding_width = 10;
        # Allow remote control via kitty remote protocol
        allow_remote_control = true;
        # Color scheme
        # foreground = "#c4c2c4";
        background = lib.mkForce "#0F0D12";
        cursor = lib.mkForce "#c4c2c4";
        # color0 = "#0F0D12";
        # color8 = "#898789";
        # color1 = "#FF6810";
        # color9 = "#FF6810";
        # color2 = "#ED6232";
        # color10 = "#ED6232";
        # color3 = "#A46354";
        # color11 = "#A46354";
        # color4 = "#CF6549";
        # color12 = "#CF6549";
        # color5 = "#717B8C";
        # color13 = "#717B8C";
        # color6 = "#7E828F";
        # color14 = "#7E828F";
        # color7 = "#c4c2c4";
        # color15 = "#c4c2c4";
      };
      extraConfig = ''
        include colors.conf
      '';
    };
  };
}
