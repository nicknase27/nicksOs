{
  age = {
    secrets = {
      # Use root ssh keys or move the user one to /etc/ssh, it won't decrypt the credentials and *will* fail without them -> crash all other lab services
      smb = {
        file = ../../secrets/smb.age;
        path = "/etc/credentials.txt";
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
        path = "data/.secret/wg.conf";
      };
      cloudflare = {
        file = ../../secrets/cloudflare.age;
      };
    };
    identityPaths = ["/etc/ssh/id_ed25519"];
  };
}
