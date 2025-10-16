{
  config,
  lib,
  pkgs,
  ...
}: let
  # Explicitly define theme in Rasi format
  rofiTheme = ''
    * {
      border: 0;
      margin: 0;
      padding: 0;
      spacing: 0;
      bg: #18181b;
      bg-alt: #27272a;
      fg: #eeeeee;
      fg-alt: #777777;
      accent: #FF670D;
      background-color: @bg;
      text-color: @fg-alt;
    }

    window {
      padding: 6px;
      transparency: "real";
      width: 800px;
      border-radius: 10px;
    }

    mainbox {
      children: [ inputbar, listview ];
    }

    inputbar {
      children: [ prompt, entry ];
    }

    entry {
      padding: 12px;
    }

    prompt {
      background-color: inherit;
      padding: 12px;
    }

    listview {
      lines: 10;
      scrollbar: true;
    }

    scrollbar {
      background-color: @bg-alt;
      handle-color: @accent;
      margin: 0 0 0 6px;
    }

    element {
      children: [ element-icon, element-text ];
    }

    element-icon {
      padding: 10px 10px;
    }

    element-text {
      padding: 10px;
    }

    element-text selected {
      background-color: @bg-alt;
      text-color: #FF670D;
    }
  '';
in {
  programs.rofi = {
    enable = true;
    font = "JetBrainsMono Nerd Font Medium 13";
    terminal = "${pkgs.kitty}/bin/kitty";

    # Apply theme correctly
    theme = "./theme.rasi";
    extraConfig = {
      show = "drun";
      display-drun = "";
      display-run = "";
      display-window = "";
    };
  };

  # Write theme to file separately
  home.file.".config/rofi/theme.rasi".text = rofiTheme;
}
