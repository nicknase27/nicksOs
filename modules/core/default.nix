{ config, pkgs, lib, ...}:
{
    imports = [
        ./audio/default.nix
        ./fonts/default.nix
        ./locale/default.nix
        ./networking/default.nix
        ./bootloader/default.nix
    ];
}