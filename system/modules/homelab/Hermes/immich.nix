{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    immich
  ];
  services = {
    immich = {
      enable = true;
      port = 2283;
      host = "0.0.0.0";
      openFirewall = true;
      mediaLocation = "/mnt/storage/media/photos";
    };
  };
  users.users.immich.extraGroups = [ "video" "render" ];
}
