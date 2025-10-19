{
  pkgs,
  lib,
  ...
}: {
  # Host-specific configurations for Iris, my VPS.
  imports = [
    #../../modules/homelab.nix
  ];
}
