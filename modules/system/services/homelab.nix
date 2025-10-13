{...}: {
  imports = [
    ./homelab/pihole.nix
    ./homelab/navidrome.nix
    #./homelab/jellyfin.nix
    ./homelab/nginx.nix
    ./homelab/vaultwarden.nix

    ./homelab/nixarr.nix
    #./homelab/arr/deluge.nix
    #./homelab/arr/prowlarr.nix
    #./homelab/arr/radarr.nix
    #./homelab/arr/sonarr.nix
  ];
}
