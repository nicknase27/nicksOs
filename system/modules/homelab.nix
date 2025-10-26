{...}: {
  imports = [
    # --- Native --- #
    ./homelab/native/navidrome.nix
    ./homelab/native/vaultwarden.nix
    ./homelab/native/cloudflared.nix
    ./homelab/native/nixarr.nix
    ./homelab/native/pihole.nix
    ./homelab/native/traefik.nix

    # --- Docker --- #
    ./homelab/docker/docker.nix
    ./homelab/docker/pihole.nix
    #./homelab/docker/nginxpm.nix
    ./homelab/docker/homarr.nix

    # --- Keepalived --- #
    ./homelab/keepalived/keepalived.nix
    ./homelab/keepalived/npmx/proxy.nix
    ./homelab/keepalived/dns.nix
  ];
}
