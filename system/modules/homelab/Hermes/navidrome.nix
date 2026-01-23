{
  config,
  agenix,
  pkgs,
  lib,
  ...
}: {
  services.navidrome = {
    enable = true;
    user = "navidrome";
    group = "navidrome";

    # main config
    settings = {
      Address = "0.0.0.0";
      Port = 4533;
      MusicFolder = "/mnt/storage/media/music";
      AlbumPlayCountMode = "normalized";
      AutoImportPlaylists = false;
      DefaultTheme = "Spotify-ish";
      EnableDownloads = true;
      DefaultDownloadableShare = true;
      EnableSharing = true;
      EnableStarRating = true;
      LastFM.Enabled = true;
    };

    # tell navidrome to load environment vars from /etc/navidrome.env
    environmentFile = "/etc/navidrome.env";
  };
  environment.etc."navidrome.env".source = config.age.secrets.navidrome-env.path;
  environment.etc."navidrome.env".mode = "0640";
  environment.etc."navidrome.env".user = "root";
  environment.etc."navidrome.env".group = "navidrome";

  systemd.services = {
    navidrome = {
      after = ["mnt-storage.mount"];
      requires = ["mnt-storage.mount"];
    };
  };

  networking.firewall.allowedTCPPorts = [4533];
}
