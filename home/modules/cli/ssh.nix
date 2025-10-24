{...}: {
  programs = {
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "Hermes" = {
          hostname = "192.168.178.210";
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
