{
  age = {
    secrets = {
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
    };
    identityPaths = ["/home/nick/.ssh/id_ed25519"];
  };
}
