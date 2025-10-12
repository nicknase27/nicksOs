{
  age = {
    secrets = {
      smb = {
        file = ../../secrets/smb.age;
        path = "/etc/credentials.txt";
        owner = "nick";
      };
    };
    identityPaths = ["/home/nick/.ssh/id_ed25519"];
  };
}
