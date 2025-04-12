{ pkgs, lib, ...}:
{
  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
  };

  security.pam = {
    services.swaylock = {};
    loginLimits = [
      { domain = "@users"; item = "rtprio"; type = "-"; value = 1; }
    ];
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
