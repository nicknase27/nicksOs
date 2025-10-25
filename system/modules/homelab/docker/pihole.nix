{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./pihole/container.nix
    ./pihole/unbound.nix
  ];
}
