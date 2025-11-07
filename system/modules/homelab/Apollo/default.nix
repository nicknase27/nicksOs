{...}: {
  imports = [
    ./uptimekuma.nix
    ./keepalived.nix
    ./wg-peer.nix
    ./grafana.nix
    ./prometheus
  ];
}
