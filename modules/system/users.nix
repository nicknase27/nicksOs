{
  config,
  pkgs,
  lib,
  ...
}: {
  users.users.nick = {
    isNormalUser = true;
    description = "Main user";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };
}
