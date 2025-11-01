{...}: {
  imports = [
    ./navidrome.nix
    ./vaultwarden.nix
    ./cloudflared.nix
    ./nixarr.nix
    ./keepalived
    ./traefik
    ./pihole
  ];
}
