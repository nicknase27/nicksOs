{...}: {
  imports = [
    ./vaultwarden.nix
    # ./cloudflared.nix
    ./keepalived.nix
    # ./navidrome.nix
    ./zerobyte.nix
    ./immich.nix
    ./nixarr.nix
    # ./traefik
    ../Apollo/tailscale.nix

    ./docker
  ];
}
