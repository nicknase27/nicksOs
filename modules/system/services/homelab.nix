{...}: {
  imports = [
    ./homelab/pihole.nix
    ./homelab/navidrome.nix
    ./homelab/caddy.nix
    #./homelab/vaultwarden.nix

    #./homelab/nixarr.nix
  ];
}
