{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    # Core system modules
    ./system/boot.nix
    ./system/networking.nix
    ./system/users.nix
    ./system/services.nix
    ./system/maintenance.nix
    ./system/locale.nix
    ./system/keymap.nix
  ];
}
