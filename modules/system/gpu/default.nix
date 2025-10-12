{ selected ? "amd" }:
{ config, pkgs, ... }:

let
    nvidia = import ./nvidia;
    amd    = import ./amd;

    modulesMap = {
        nvidia = nvidia;
        amd    = amd;
    };

    # Filter only selected modules
    chosenModules = map (name: modulesMap.${name}) selected;

in
{
    imports = chosenModules;
}
