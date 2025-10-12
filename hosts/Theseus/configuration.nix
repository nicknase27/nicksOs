{ config, pkgs, lib, ... }:
{
    imports = [
        ./hardware-configuration.nix
        ../common.nix

        (import ../../modules/user/wms/wayland { selected = ["hyprland"]; })
        (import ../../modules/user/terminals { selected = ["kitty"]; })
        (import ../../modules/system/gpu { selected = ["amd"]; })
        
        ../../modules/system/default.nix
    ];
}