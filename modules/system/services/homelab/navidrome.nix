{...}: {
  services.navidrome = {
    enable = true;
    user = "nick";
    group = "users";
    settings = {
      MusicFolder = "/mnt/share/media/Music";
    };
  };
}
