{
  age = {
    secrets = {
      # Use root ssh keys or move the user one to /etc/ssh, it won't decrypt the credentials and *will* fail without them -> crash all other lab services
      smb = {
        file = ../../secrets/smb.age;
        path = "/etc/credentials.txt";
        mode = "777";
      };
    };
    identityPaths = ["/etc/ssh/id_ed25519"];
  };
}
