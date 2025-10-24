{...}: {
  imports = [
    # --- Native --- #
    ./homelab/native/navidrome.nix
    ./homelab/native/vaultwarden.nix
    ./homelab/native/cloudflared.nix
    ./homelab/native/nixarr.nix

    # --- Docker --- #
    ./homelab/docker/docker.nix
    ./homelab/docker/pihole.nix
    ./homelab/docker/nginxpm.nix
    ./homelab/docker/homarr.nix
  ];
}
