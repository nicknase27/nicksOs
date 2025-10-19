{
  pkgs,
  lib,
  ...
}: {
  # Host-specific configurations for Iris, my VPS.
  imports = [
    #../../modules/homelab.nix
    ../../modules/system/services/fail2ban.nix
  ];
}
