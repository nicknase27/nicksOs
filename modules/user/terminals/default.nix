{ selected ? "kitty" }:
{ config, pkgs, ... }:

let
    kitty = import ./kitty;
    alacritty    = import ./alacritty;

    modulesMap = {
        kitty = kitty;
        alacritty    = alacritty;
    };

    # Filter only selected modules
    chosenModules = map (name: modulesMap.${name}) selected;

in
{
    imports = chosenModules;
}
