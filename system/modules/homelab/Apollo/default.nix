{...}: {
  imports = [
    ./uptimekuma.nix
    ./keepalived.nix
    ./grafana.nix
    ./prometheus
  ];
}
