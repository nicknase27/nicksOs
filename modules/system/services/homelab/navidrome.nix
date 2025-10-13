{...}: {
  services.navidrome = {
    enable = true;
    user = "nick";
    group = "users";
    settings = {
      Address = "0.0.0.0";
      Port = 4533;
      MusicFolder = "/mnt/share/media/Music";
      EnableSharing = true;
    };
  };
}
