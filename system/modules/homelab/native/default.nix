{...}: {
  imports = [
    ./navidrome.nix
    ./vaultwarden.nix
    ./cloudflared.nix
    ./nixarr.nix
    ./traefik
    ./pihole
  ];
}
