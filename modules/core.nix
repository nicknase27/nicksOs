{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./system/audio.nix
    ./system/bluetooth.nix
    ./system/boot.nix
    ./system/fonts.nix
    ./system/locale.nix
    ./system/networking.nix
    ./system/users.nix
    ./system/shells.nix
    ./system/maintenance.nix
    ./system/services.nix
    ./system/keymap.nix
  ];
}
