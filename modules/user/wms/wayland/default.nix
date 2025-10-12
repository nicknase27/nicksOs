{selected ? ["hyprland"]}: {
  config,
  pkgs,
  ...
}: let
  # Import the atomic modules
  hyprland = import ./hyprland;
  sway = import ./sway;

  # Map of module names → module
  modulesMap = {
    hyprland = hyprland;
    sway = sway;
  };

  # Filter only selected modules
  chosenModules = map (name: modulesMap.${name}) selected;
in {
  imports = chosenModules;

  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    xwayland
    wayland
    waybar
    grim
    slurp
    wl-clipboard
    mako
    rofi
  ];

  #environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
