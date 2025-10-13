{...}: {
  services.sonarr = {
    enable = true;
    openFirewall = true;
    user = "nick";
    group = "users";
    dataDir = "/home/nick/sonarr/data";
  };
}
