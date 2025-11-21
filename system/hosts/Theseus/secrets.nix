{
  age = {
    secrets = {
      # Use root ssh keys or move the user one to /etc/ssh, it won't decrypt the credentials and *will* fail without them -> crash all other lab services
      smb = {
        file = ../../secrets/smb.age;
        path = "/etc/credentials.txt";
        mode = "777";
      };
      smb2 = {
        file = ../../secrets/smb2.age;
        path = "/etc/credentials2.txt";
        mode = "777";
      };
    };
    identityPaths = ["/etc/ssh/id_ed25519"];
  };
}
