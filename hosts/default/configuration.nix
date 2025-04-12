{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./disko-config.nix
      ../common.nix
      #../modules/nixos/gaming.nix
    ];

  boot.supportedFilesystems = ["ntfs"];

  networking.hostName = "Wu"; # Define your hostname.

  environment.systemPackages = with pkgs; [
    
  ];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  system.stateVersion = "24.11"; # Did you read the comment?

}
