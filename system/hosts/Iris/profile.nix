{
  pkgs,
  lib,
  ...
}: {
  # Host-specific configurations for Iris, my VPS.
  imports = [
    ../../modules/profiles/server.nix
    #../../modules/homelab.nix
    ../../modules/system/services/fail2ban.nix
  ];
}
