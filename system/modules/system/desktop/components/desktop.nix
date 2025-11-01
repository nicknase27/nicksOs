{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    hypridle
    hyprlock
    hyprpicker
    grim
    slurp
    wl-clipboard
    mako
    wayland
    xwayland
    waybar
    swww
    rofi
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
