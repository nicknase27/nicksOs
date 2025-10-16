{
  config,
  pkgs,
  lib,
  ...
}: {
  services = {
    audiobookshelf = {
      enable = true;
      port = 8000;
      user = "audiobookshelf";
      group = "audiobookshelf";
      openFirewall = true;
      dataDir = "audiobookshelf";
    };
  };
}
