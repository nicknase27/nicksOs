{
  pkgs,
  lib,
  ...
}: {
  # User-specific configurations for Hermes, my homelab.
  imports = [
    ../../modules/system/services/homelab.nix
    ../../modules/user/apps/utils.nix

    #../../modules/user/apps/misc.nix
  ];
}
