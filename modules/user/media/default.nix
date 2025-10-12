{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./vesktop/default.nix
    ./feishin/default.nix
  ];

  environment.systemPackages = with pkgs; [
    (callPackage ./brrtfetch/default.nix {})
  ];
}
