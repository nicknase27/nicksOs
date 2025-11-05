{...}: {
  programs = {
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "Theseus" = {
          hostname = "192.168.178.20";
          user = "nick";
        };
        "Hermes" = {
          hostname = "192.168.178.210";
          user = "nick";
        };
        "Apollo" = {
          hostname = "192.168.178.215";
          user = "nick";
        };
        "Iris" = {
          hostname = "130.61.151.118";
          user = "nick";
        };
      };
    };
  };
}
