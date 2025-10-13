{
  age = {
    secrets = {
      smb = {
        file = ../../secrets/smb.age;
        path = "/etc/credentials.txt";
        owner = "nick";
      };
      vaultwarden-token = {
        file = ../../secrets/vaultwarden-token.age;
        path = "/var/lib/vaultwarden/vaultwarden.env";
      };
      wireguard-key = {
        file = ../../secrets/wireguard-key.age;
      };
      wireguard-address = {
        file = ../../secrets/wireguard-address.age;
      };
      navidrome-env = {
        file = ../../secrets/navidrome-env.age;
        path = "/etc/navidrome.env";
      };
      wireguard-conf = {
        file = ../../secrets/wireguard-conf.age;
        path = "data/.secret/wg.conf";
      };
    };
    identityPaths = ["/home/nick/.ssh/id_ed25519"];
  };
}
