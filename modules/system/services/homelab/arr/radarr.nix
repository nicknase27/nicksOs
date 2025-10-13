{...}: {
  services.radarr = {
    enable = true;
    openFirewall = true;
    user = "nick";
    group = "users";
    dataDir = "/home/nick/radarr/data";
  };
}
