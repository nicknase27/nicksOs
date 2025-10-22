{...}: {
  services.vaultwarden = {
    enable = true;
    backupDir = "/var/lib/vault-backup";
    # in order to avoid having  ADMIN_TOKEN in the nix store it can be also set with the help of an environment file
    # be aware that this file must be created by hand (or via secrets management like sops)
    environmentFile = "/var/lib/vaultwarden/vaultwarden.env";
    config = {
      # Refer to https://github.com/dani-garcia/vaultwarden/blob/main/.env.template
      DOMAIN = "https://vw.nicknase27.com";
      SIGNUPS_ALLOWED = true;

      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
      ROCKET_LOG = "critical";
    };
  };

  # Open firewall ports for HTTP, HTTPS, and Vaultwarden WebSocket
  networking.firewall.allowedTCPPorts = [80 443 3012];
}
