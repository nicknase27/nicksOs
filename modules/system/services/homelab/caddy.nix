{
  pkgs,
  config,
  ...
}: let
  certloc = "/var/lib/acme/nicknase27.com";
in {
  security.acme = {
    acceptTerms = true;
    defaults.email = "nicknase@nicknase27.com";

    certs."nicknase27.com" = {
      group = config.services.caddy.group;

      domain = "nicknase27.com";
      extraDomainNames = ["*.nicknase27.com"];
      dnsProvider = "cloudflare";
      dnsResolver = "1.1.1.1:53";
      dnsPropagationCheck = true;
      environmentFile = config.age.secrets.cloudflare.path;
    };
  };

  services.caddy = {
    enable = true;
    virtualHosts."vault.nicknase27.com".extraConfig = ''
      encode zstd gzip
      reverse_proxy :${toString config.services.vaultwarden.config.ROCKET_PORT} {
        header_up X-Real-IP {remote_host}
        header_up Upgrade {>Upgrade}
        header_up Connection {>Connection}
        }
        tls ${certloc}/cert.pem ${certloc}/key.pem {
          protocols tls1.3
      }
    '';
  };
}
