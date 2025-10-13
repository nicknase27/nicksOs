{...}: {
  services.radarr = {
    enable = true;
    openFirewall = true;
    user = "sonarr";
    group = "sonarr";
    dataDir = "/etc/radarr/data";
  };
}
