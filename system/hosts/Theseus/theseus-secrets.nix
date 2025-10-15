{
  age = {
    secrets = {
      # Use root ssh keys or move the user one to /etc/ssh, it won't decrypt the credentials and *will* fail without them -> crash all other lab services
      smb = {
        file = ../../secrets/smb.age;
        path = "/etc/credentials.txt";
        mode = "777";
      };
      #vaultwarden-token = {
      #  file = ../../secrets/vaultwarden-token.age;
      #  path = "/var/lib/vaultwarden/vaultwarden.env";
      #};
      navidrome-env = {
        file = ../../secrets/navidrome-env.age;
        path = "/var/lib/secrets/navidrome.env";
      };
      wireguard-conf = {
        file = ../../secrets/wireguard-conf.age;
        path = "data/.secret/wg.conf";
      };
      cloudflare = {
        file = ../../secrets/cloudflare.age;
      };
      cloudflare-cert = {
        file = ../../secrets/cloudflare-cert.age;
        path = "/var/lib/cloudflared/cert.pem";
      };
      cloudflare-creds = {
        file = ../../secrets/cloudflare-creds.age;
        path = "/var/lib/cloudflared/911ae7cf-2eaf-400b-a6c2-35f79b7ffea5.json";
      };
      jellyfin-api = {
        file = ../../secrets/jellyfin-api.age;
      };
      navidrome-api = {
        file = ../../secrets/navidrome-api.age;
      };
      radarr-api = {
        file = ../../secrets/radarr-api.age;
        path = "/var/lib/secrets/radarr-api.txt";
      };
      sonarr-api = {
        file = ../../secrets/sonarr-api.age;
      };
      prowlarr-api = {
        file = ../../secrets/prowlarr-api.age;
      };
      jellyseerr-api = {
        file = ../../secrets/jellyseerr-api.age;
      };
    };
    identityPaths = ["/etc/ssh/id_ed25519"];
  };
}
