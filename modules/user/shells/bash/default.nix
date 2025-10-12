{ config, pkgs, lib, attrPairs, ... }:

let
  default = import ../default.nix { inherit lib; };
  mkAliases = lib.concatMapStrings (alias: "alias ${alias.key}='${alias.value}'\n") (lib.attrPairs default.aliases);
  mkFunctions = lib.concatMapStrings (f: "${f.key}() { ${f.value}; }\n") (lib.attrPairs default.functions);
in
{
  programs.bash.enable = true;

  # Inject shared aliases/functions/envVars
  programs.bash.initExtra = ''
    ${mkAliases}
    ${mkFunctions}
  '';
}
