{ config, pkgs, lib, ... }:
{
    imports = [
        ./hardware-configuration.nix
        ../common.nix

        (import ../../modules/user/wms/wayland { selected = ["sway"]; })
        (import ../../modules/user/terminals { selected = ["kitty"]; })
        (import ../../modules/system/gpu { selected = ["nvidia"]; })
        
        ../../modules/system/default.nix
    ];
}