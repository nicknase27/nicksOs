{
  config,
  pkgs,
  lib,
  ...
}: {
  users.users.nick = {
    isNormalUser = true;
    description = "Main user";
    extraGroups = ["networkmanager" "wheel" "libvirtd" "docker"];
    packages = with pkgs; [];
    shell = pkgs.bash;
    hashedPassword = "$y$j9T$09DQFTafu0gM7aCXti4pa/$QBVsTbbjVs3C3usVOgax.3iRaatX1Apz4E6BXrTKuF4";
  };
}
