{...}: {
  imports = [
    ./uptimekuma.nix
    ./keepalived.nix
    ./tailscale.nix
    # ./wg-peer.nix
    ./grafana.nix
    ./prometheus
    ./caddy.nix
    # ./mc.nix
  ];
}
