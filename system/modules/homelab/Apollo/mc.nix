{ pkgs, lib, ... }:
{
  services.minecraft-server = {
    enable = true;
    eula = true;
    openFirewall = true;
    package = pkgs.papermcServers.papermc-1_21_8;
    dataDir = "/var/lib/minecraft/paper-1.21.8";
    };


}
