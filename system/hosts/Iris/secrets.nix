{
  age = {
    secrets = {
      # Use root ssh keys or move the user one to /etc/ssh, it won't decrypt the credentials and *will* fail without them -> crash all other lab services
    };
    identityPaths = ["/etc/ssh/id_ed25519"];
  };
}
