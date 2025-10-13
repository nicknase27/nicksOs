{...}: {
  services.sonarr = {
    enable = true;
    openFirewall = true;
    user = "sonarr";
    group = "sonarr";
    dataDir = "/etc/sonarr/data";
  };
}
