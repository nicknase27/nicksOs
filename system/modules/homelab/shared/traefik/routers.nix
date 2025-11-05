{...}: {
  services = {
    traefik = {
      dynamicConfigOptions = {
        http = {
          routers = {
            dashboard = {
              rule = "PathPrefix(`/api`) || PathPrefix(`/dashboard`)";
              service = "api@internal";
              entryPoints = ["dashboard"];
            };
            traefik = {
              rule = "Host(`traefik.nicknase27.com`)";
              service = "api@internal";
              entryPoints = ["websecure"];
              tls = {
                certResolver = "cloudflare";
                domains = [
                  {
                    main = "*.nicknase27.com";
                    sans = ["nicknase27.com"];
                  }
                ];
              };
            };
            dash = {
              rule = "Host(`dash.nicknase27.com`)";
              service = "dash";
              entryPoints = ["websecure"];
              tls = {
                certResolver = "cloudflare";
              };
            };
            dns1 = {
              rule = "Host(`dns1.nicknase27.com`)";
              service = "dns1";
              entryPoints = ["websecure"];
              tls = {
                certResolver = "cloudflare";
              };
            };
            dns2 = {
              rule = "Host(`dns2.nicknase27.com`)";
              service = "dns2";
              entryPoints = ["websecure"];
              tls = {
                certResolver = "cloudflare";
              };
            };
            jellyseerr = {
              rule = "Host(`jellyseerr.nicknase27.com`)";
              service = "jellyseerr";
              entryPoints = ["websecure"];
              tls = {
                certResolver = "cloudflare";
              };
            };
            music = {
              rule = "Host(`music.nicknase27.com`)";
              service = "music";
              entryPoints = ["websecure"];
              tls = {
                certResolver = "cloudflare";
              };
            };
            prowlarr = {
              rule = "Host(`prowlarr.nicknase27.com`)";
              service = "prowlarr";
              entryPoints = ["websecure"];
              tls = {
                certResolver = "cloudflare";
              };
            };
            pxmx = {
              rule = "Host(`pxmx.nicknase27.com`)";
              service = "pxmx";
              entryPoints = ["websecure"];
              tls = {
                certResolver = "cloudflare";
              };
            };
            radarr = {
              rule = "Host(`radarr.nicknase27.com`)";
              service = "radarr";
              entryPoints = ["websecure"];
              tls = {
                certResolver = "cloudflare";
              };
            };
            sonarr = {
              rule = "Host(`sonarr.nicknase27.com`)";
              service = "sonarr";
              entryPoints = ["websecure"];
              tls = {
                certResolver = "cloudflare";
              };
            };
            storage = {
              rule = "Host(`storage.nicknase27.com`)";
              service = "storage";
              entryPoints = ["websecure"];
              tls = {
                certResolver = "cloudflare";
              };
            };
            torrent = {
              rule = "Host(`torrent.nicknase27.com`)";
              service = "torrent";
              entryPoints = ["websecure"];
              tls = {
                certResolver = "cloudflare";
              };
            };
            vault = {
              rule = "Host(`vault.nicknase27.com`)";
              service = "vault";
              entryPoints = ["websecure"];
              tls = {
                certResolver = "cloudflare";
              };
            };
            watch = {
              rule = "Host(`watch.nicknase27.com`)";
              service = "watch";
              entryPoints = ["websecure"];
              tls = {
                certResolver = "cloudflare";
              };
            };
            grafana = {
              rule = "Host(`grafana.nicknase27.com`)";
              service = "grafana";
              entryPoints = ["websecure"];
              tls = {
                certResolver = "cloudflare";
              };
            };
            prometheus = {
              rule = "Host(`prometheus.nicknase27.com`)";
              service = "prometheus";
              entryPoints = ["websecure"];
              tls = {
                certResolver = "cloudflare";
              };
            };
          };
        };
      };
    };
  };
}
