{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./pihole/container.nix
    ./pihole/users.nix
    ./pihole/unbound.nix
  ];
}
