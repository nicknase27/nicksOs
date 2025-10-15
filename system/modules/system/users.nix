{
  config,
  pkgs,
  lib,
  ...
}: {
  users.users.nick = {
    isNormalUser = true;
    description = "Main user";
    extraGroups = ["networkmanager" "wheel" "libvirtd"];
    packages = with pkgs; [];
    shell = pkgs.bash;
  };
}
