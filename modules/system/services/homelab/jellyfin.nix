{...}: {
  services.jellyfin = {
    enable = true;
    dataDir = "/home/nick/lab/jellyfin/data";
    user = "nick";
  };
}
