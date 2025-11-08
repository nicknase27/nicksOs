{...}: {
  imports = [
    ./vaultwarden.nix
    ./cloudflared.nix
    ./keepalived.nix
    ./navidrome.nix
    ./nixarr.nix
    ./traefik

    ./docker
  ];
}
