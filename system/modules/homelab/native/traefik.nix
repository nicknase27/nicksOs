{ config, pkgs, ... }:
{
  # Enable Traefik service
  services.traefik = {
    enable = true;

    # Static configuration for Traefik
    staticConfigOptions = {
      global = {
        checkNewVersion = true;
        sendAnonymousUsage = false;
      };

      # Entry points for HTTP, HTTPS, and dashboard
      entryPoints = {
        web = {
          address = ":80";
          http = {
            redirections = {
              entryPoint = {
                to = "websecure";
                scheme = "https";
                permanent = true;
              };
            };
          };
        };
        websecure = {
          address = ":443";
        };
        dashboard = {
          address = ":8081";
        };
      };

      # Enable Traefik dashboard
      api = {
        dashboard = true;
        insecure = true; # Allows dashboard on http://<ip>:8081
      };

      # Configure ACME for SSL certificates
      #certificatesResolvers = {
      #  myresolver = {
      #    acme = {
      #      email = "nicknase@duck.com"; # Replace with your email
      #      storage = "/var/lib/traefik/acme.json";
      #      dnsChallenge = {
      #        provider = "cloudflare";
      #        delayBeforeCheck = 0;
      #      };
      #    };
      #  };
      #};
 
      certificatesResolvers = {
	cloudflare = {
	  acme = {
	    email = "nicknase@duck.com";
	    storage = "/var/lib/traefik/acme.json";
	    dnsChallenge = {
	      provider = "cloudflare";
	      resolvers = [
		"1.1.1.1"
		"8.8.8.8"
	      ];
	    };
	  };
	};
      };

      # Logging
      log = {
        level = "INFO";
      };

      # Access logs
      accessLog = {};
    };

    # Dynamic configuration (minimal, for dashboard access)
    
    dynamicConfigOptions = {
  http = {
    routers = {
      dashboard = {
        rule = "PathPrefix(`/api`) || PathPrefix(`/dashboard`)";
        service = "api@internal";
        entryPoints = [ "dashboard" ];
      };
      dash = {
        rule = "Host(`dash.nicknase27.com`)";
        service = "dash";
        entryPoints = [ "websecure" ];
        tls = {
          certResolver = "cloudflare";
        };
      };
      dns1 = {
        rule = "Host(`dns1.nicknase27.com`)";
        service = "dns1";
        entryPoints = [ "websecure" ];
        tls = {
          certResolver = "cloudflare";
        };
      };
      dns2 = {
        rule = "Host(`dns2.nicknase27.com`)";
        service = "dns2";
        entryPoints = [ "websecure" ];
        tls = {
          certResolver = "cloudflare";
        };
      };
      jellyseerr = {
        rule = "Host(`jellyseerr.nicknase27.com`)";
        service = "jellyseerr";
        entryPoints = [ "websecure" ];
        tls = {
          certResolver = "cloudflare";
        };
      };
      music = {
        rule = "Host(`music.nicknase27.com`)";
        service = "music";
        entryPoints = [ "websecure" ];
        tls = {
          certResolver = "cloudflare";
        };
      };
      traefik = {
        rule = "Host(`traefik.nicknase27.com`)";
        service = "api@internal";
        entryPoints = [ "websecure" ];
        tls = {
          certResolver = "cloudflare";
	  domains = [
	    {
	      main = "*.nicknase27.com";
	      sans = [ "nicknase27.com" ];
	    }
	  ];
        };
      };
      prowlarr = {
        rule = "Host(`prowlarr.nicknase27.com`)";
        service = "prowlarr";
        entryPoints = [ "websecure" ];
        tls = {
          certResolver = "cloudflare";
        };
      };
      pxmx = {
        rule = "Host(`pxmx.nicknase27.com`)";
        service = "pxmx";
        entryPoints = [ "websecure" ];
        tls = {
          certResolver = "cloudflare";
        };
      };
      radarr = {
        rule = "Host(`radarr.nicknase27.com`)";
        service = "radarr";
        entryPoints = [ "websecure" ];
        tls = {
          certResolver = "cloudflare";
        };
      };
      sonarr = {
        rule = "Host(`sonarr.nicknase27.com`)";
        service = "sonarr";
        entryPoints = [ "websecure" ];
        tls = {
          certResolver = "cloudflare";
        };
      };
      storage = {
        rule = "Host(`storage.nicknase27.com`)";
        service = "storage";
        entryPoints = [ "websecure" ];
        tls = {
          certResolver = "cloudflare";
        };
      };
      torrent = {
        rule = "Host(`torrent.nicknase27.com`)";
        service = "torrent";
        entryPoints = [ "websecure" ];
        tls = {
          certResolver = "cloudflare";
        };
      };
      vault = {
        rule = "Host(`vault.nicknase27.com`)";
        service = "vault";
        entryPoints = [ "websecure" ];
        tls = {
          certResolver = "cloudflare";
        };
      };
      watch = {
        rule = "Host(`watch.nicknase27.com`)";
        service = "watch";
        entryPoints = [ "websecure" ];
        tls = {
          certResolver = "cloudflare";
        };
      };
    };
    services = {
      dash = {
        loadBalancer = {
          servers = [
            { url = "http://192.168.178.210:7575"; }
          ];
        };
      };
      dns1 = {
        loadBalancer = {
          servers = [
            { url = "http://192.168.178.250:8085/"; }
          ];
        };
      };
      dns2 = {
        loadBalancer = {
          servers = [
            { url = "http://192.168.178.202:8080/admin"; }
          ];
        };
      };
      jellyseerr = {
        loadBalancer = {
          servers = [
            { url = "http://192.168.178.210:5055"; }
          ];
        };
      };
      music = {
        loadBalancer = {
          servers = [
            { url = "http://192.168.178.210:4533"; }
          ];
        };
      };
      prowlarr = {
        loadBalancer = {
          servers = [
            { url = "http://192.168.178.210:9696"; }
          ];
        };
      };
      pxmx = {
        loadBalancer = {
          servers = [
            { url = "http://192.168.178.200:8006"; }
          ];
        };
      };
      radarr = {
        loadBalancer = {
          servers = [
            { url = "http://192.168.178.210:7878"; }
          ];
        };
      };
      sonarr = {
        loadBalancer = {
          servers = [
            { url = "http://192.168.178.210:8989"; }
          ];
        };
      };
      storage = {
        loadBalancer = {
          servers = [
            { url = "http://192.168.178.210:80"; }
          ];
        };
      };
      torrent = {
        loadBalancer = {
          servers = [
            { url = "http://192.168.178.210:9091"; }
          ];
        };
      };
      vault = {
        loadBalancer = {
          servers = [
            { url = "http://192.168.178.210:8222"; }
          ];
        };
      };
      watch = {
        loadBalancer = {
          servers = [
            { url = "http://192.168.178.210:8096"; }
          ];
        };
      };
    };
  };
};
  };

  # Ensure Traefik can read the environment file
  systemd.services.traefik = {
    serviceConfig = {
      #EnvironmentFile = "/etc/traefik/traefik.env";
      EnvironmentFile = config.age.secrets.cloudflare.path;
    };
  };

  # Open firewall ports
  networking.firewall.allowedTCPPorts = [ 80 443 8081 ];

  # Ensure acme.json file has correct permissions
  systemd.services.traefik.preStart = ''
    mkdir -p /var/lib/traefik
    touch /var/lib/traefik/acme.json
    chmod 600 /var/lib/traefik/acme.json
  '';
}
