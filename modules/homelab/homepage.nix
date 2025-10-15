{
  config,
  lib,
  ...
}: {
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    listenPort = 3030;
    allowedHosts = "localhost";

    widgets = [
      {search = {provider = "duckduckgo";};}
      {
        resources = {
          label = "system";
          cpu = true;
          memory = true;
        };
      }
      {
        resources = {
          label = "storage";
          disk = ["/"];
        };
      }
    ];

    services = [
      {
        Media = [
          {
            Navidrome = {
              icon = "navidrome.svg";
              href = "http://localhost:4533";
              description = "Music Server";
              widget = {};
              ping = "http://localhost:4533";
            };
          }
          {
            Jellyfin = {
              icon = "jellyfin.svg";
              href = "http://localhost:8096";
              description = "Media player";
              widget = {
                type = "jellyfin";
                url = "http://localhost:8096";
                key = "";
              };
              ping = "http://localhost:8096";
            };
          }
          {
            # TODO
          }
        ];
      }
      {
        Arr = [
          {
            Radarr = {
              icon = "radarr.svg";
              href = "http://localhost:7878";
              description = "Movie Manager";
              widget = {
                type = "radarr";
                url = "http://localhost:7878";
                key = "";
              };
              ping = "http://localhost:7878";
            };
          }
          {
            Sonarr = {
              icon = "sonarr.svg";
              href = "http://localhost:8989";
              description = "Show Manager";
              widget = {
                type = "sonarr";
                url = "http://localhost:8989";
                key = "";
              };
              ping = "http://localhost:8989";
            };
          }
          {
            Prowlarr = {
              icon = "prowlarr.svg";
              href = "http://localhost:9696";
              description = "Index Manager";
              widget = {
                type = "prowlarr";
                url = "http://localhost:9696";
                key = "";
              };
              ping = "http://localhost:9696";
            };
          }
          {
            Jellyseerr = {
              icon = "jellyseerr.svg";
              href = "http://localhost:5055";
              description = "Media Requester";
              widget = {
                type = "jellyseerr";
                url = "http://localhost:5055";
                key = "";
              };
              ping = "http://localhost:5055";
            };
          }
          {
            Transmission = {
              icon = "transmission.svg";
              href = "http://localhost:9091";
              description = "Torrent Downloader";
              widget = {
                type = "transmission";
                url = "http://localhost:9091";
                fields = ["download" "upload"];
              };
              ping = "http://localhost:9091";
            };
          }
        ];
      }
    ];
  };
}
