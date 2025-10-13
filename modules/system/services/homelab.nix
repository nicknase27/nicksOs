{...}: {
  imports = [
    ./homelab/pihole.nix
    ./homelab/navidrome.nix
    ./homelab/jellyfin.nix
  ];
}
