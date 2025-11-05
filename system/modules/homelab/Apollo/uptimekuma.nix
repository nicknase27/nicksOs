{...}: {
  services = {
    uptime-kuma = {
      enable = true;
      appriseSupport = true;
      settings = {
        HOST = "0.0.0.0";
      };
    };
  };

  networking.firewall = {
    allowedTCPPorts = [3001];
  };
}
