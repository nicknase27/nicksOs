{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./routers.nix
    ./services.nix
  ];

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
  };

  # Ensure Traefik can read the environment file
  systemd.services.traefik = {
    serviceConfig = {
      EnvironmentFile = config.age.secrets.cloudflare.path;
    };
  };

  # Open firewall ports
  networking.firewall.allowedTCPPorts = [80 443 8081];

  # Ensure acme.json file has correct permissions
  systemd.services.traefik.preStart = ''
    mkdir -p /var/lib/traefik
    touch /var/lib/traefik/acme.json
    chmod 600 /var/lib/traefik/acme.json
  '';
}
