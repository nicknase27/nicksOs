{
  age = {
    secrets = {
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
    };
    identityPaths = ["/home/nick/.ssh/id_ed25519"];
  };
}
