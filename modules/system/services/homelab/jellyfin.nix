{...}: {
  services.jellyfin = {
    enable = true;
    dataDir = "/home/nick/jellyfin/data";
    user = "nick";
  };
}
