{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    vesktop
    feishin
    mpv
  ];
}
