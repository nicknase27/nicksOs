{config, ...}: {
  services.prometheus = {
    enable = true;
    port = 9001;
    scrapeConfigs = [
      {
        job_name = "Apollo";
        static_configs = [
          {
            targets = ["127.0.0.1:${toString config.services.prometheus.exporters.node.port}"];
          }
        ];
      }
      {
        job_name = "Hermes";
        static_configs = [
          {
            targets = ["192.168.178.210:${toString config.services.prometheus.exporters.node.port}"];
          }
        ];
      }
    ];
  };

  networking.firewall = {
    allowedTCPPorts = [9001];
  };
}
