{
  age = {
    secrets = {
      # Use root ssh keys or move the user one to /etc/ssh, it won't decrypt the credentials and *will* fail without them -> crash all other lab services
      smb = {
        file = ../../secrets/smb.age;
        path = "/var/lib/secrets/credentials.txt";
        mode = "777";
      };
      vaultwarden-token = {
        file = ../../secrets/vaultwarden-token.age;
        path = "/var/lib/vaultwarden/vaultwarden.env";
      };
      navidrome-env = {
        file = ../../secrets/navidrome-env.age;
        path = "/var/lib/secrets/navidrome.env";
      };
      wireguard-conf = {
        file = ../../secrets/wireguard-conf.age;
        path = "/var/lib/secrets/wg.conf";
        mode = "777";
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
      pihole-token = {
        file = ../../secrets/pihole-token.age;
        path = "/var/lib/secrets/pihole-token.env";
        mode = "777";
      };
      homarr-token = {
        file = ../../secrets/homarr-token.age;
        path = "/var/lib/secrets/homarr-token.env";
        mode = "777";
      };
      authentik_env = {
        file = ../../secrets/authentik_env.age;
	path = "/var/lib/secrets/authentik_env.env";
      };
    };
    identityPaths = ["/etc/ssh/id_ed25519"];
  };
}
