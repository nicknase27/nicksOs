{
  age = {
    secrets = {
      smb = {
        file = ../../secrets/smb.age;
        path = "/etc/credentials.txt";
        owner = "nick";
      };
      navidrome-env = {
        file = ../../secrets/navidrome-env.age;
        path = "/etc/navidrome.env";
      };
    };
    identityPaths = ["/home/nick/.ssh/id_ed25519"];
  };
}
