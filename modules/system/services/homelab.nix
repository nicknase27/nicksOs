{...}: {
  imports = [
    ./homelab/pihole.nix
    ./homelab/navidrome.nix
    ./homelab/jellyfin.nix
    ./homelab/nginx.nix
    ./homelab/vaultwarden.nix
  ];
}
