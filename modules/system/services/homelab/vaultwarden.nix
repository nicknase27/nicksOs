{...}: {
  services.vaultwarden = {
    enable = true;
    backupDir = "/var/lib/vault-backup";
    # in order to avoid having  ADMIN_TOKEN in the nix store it can be also set with the help of an environment file
    # be aware that this file must be created by hand (or via secrets management like sops)
    environmentFile = "/var/lib/vaultwarden/vaultwarden.env";
    config = {
      # Refer to https://github.com/dani-garcia/vaultwarden/blob/main/.env.template
      DOMAIN = "http://localhost";
      SIGNUPS_ALLOWED = false;

      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
      ROCKET_LOG = "critical";

      # This example assumes a mailserver running on localhost,
      # thus without transport encryption.
      # If you use an external mail server, follow:
      #   https://github.com/dani-garcia/vaultwarden/wiki/SMTP-configuration
      SMTP_HOST = "127.0.0.1";
      SMTP_PORT = 25;
      SMTP_SSL = false;

      SMTP_FROM = "admin@bitwarden.example.com";
      SMTP_FROM_NAME = "example.com Bitwarden server";
    };
  };
}
