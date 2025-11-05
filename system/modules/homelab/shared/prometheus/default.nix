{
  config,
  pkgs,
  ...
}: {
  services.prometheus.exporters.node = {
    enable = true;
    port = 9002;
    enabledCollectors = ["systemd"];
    extraFlags = ["--collector.ethtool" "--collector.softirqs" "--collector.tcpstat" "--collector.wifi"];
  };

  networking.firewall = {
    allowedTCPPorts = [9002];
  };
}
