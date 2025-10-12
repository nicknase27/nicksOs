{
  age = {
    secrets = {
      secret1 = {
        file = ../../secrets/secret1.age;
        owner = "nick";
        group = "nick";
      };
      smb-credentials = {
        file = ../../secrets/smb-credentials.age;
        owner = "nick";
        path = "/etc/credentials.txt";
      };
    };
  };
}
