{ config, pkgs, lib, ...}:
{

  environment.systemPackages = with pkgs; [
    (discord.override {
      withOpenASAR = true; # can do this here too
      withVencord = true;
    })
  ];

}
