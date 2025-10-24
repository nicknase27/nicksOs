{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./pihole/container.nix
    ./pihole/keepalived.nix
    ./pihole/users.nix
  ];
}
