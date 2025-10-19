{
  pkgs,
  lib,
  ...
}: {
  # Host-specific configurations for Iris, my VPS.
  imports = [
    #../../modules/homelab.nix
    ../../modules/user/apps/utils.nix
  ];

  services = {
    displayManager = {
      sddm = {
        enable = lib.mkForce false;
      };
    };
  };
}
