{
  config,
  lib,
  ...
}: {
  services.nginx.virtualHosts."vault.nicknase27.com" = {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
    };
  };
}
