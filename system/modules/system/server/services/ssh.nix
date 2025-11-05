{...}: {
  services = {
    openssh = {
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };
  };

  users.users.nick.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJwouafzGDRGeMJQbm9ME/1CSkXicdL7TthJjWkhyLYd nick@Theseus"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF6WDX5De9IY7cfl4XZg6mWLVGDQli5/F2DNecZvs7gk nick@Hermes"
  ];
}
