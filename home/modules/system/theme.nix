{pkgs, ...}: {
  services = {
    swww = {
      enable = true;
    };
  };

  stylix = {
    enable = false;
    cursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-dark";
      size = 26;
    };
    base16Scheme = {
      base00 = "#0F0D12";
      base01 = "#FF6810";
      base02 = "#ED6232";
      base03 = "#A46354";
      base04 = "#CF6549";
      base05 = "#717B8C";
      base06 = "#7E828F";
      base07 = "#c3c2c3";
      base08 = "#65586c";
      base09 = "#FF6810";
      base0A = "#ED6232";
      base0B = "#A46354";
      base0C = "#CF6549";
      base0D = "#717B8C";
      base0E = "#7E828F";
      base0F = "#c3c2c3";
    };
    targets = {
      rofi.enable = false;
      hyprland.enable = false;
      kitty.enable = false;
      mako.enable = false;
      btop.enable = false;
      starship.enable = false;
    };
  };
}
