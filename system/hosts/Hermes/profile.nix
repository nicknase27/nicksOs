{
  pkgs,
  lib,
  ...
}: {
  # Host-specific configurations for Hermes, my homelab.
  imports = [
    ../../modules/homelab.nix
    ../../modules/user/apps/utils.nix

    #../../modules/user/apps/misc.nix
  ];
}
