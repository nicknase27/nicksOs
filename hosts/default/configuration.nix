{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./disko-config.nix
    ../common.nix
    ../../modules/nixos/samba.nix
    ../../modules/nixos/gpu.nix
    ../../modules/nixos/gaming.nix
  ];

  boot.supportedFilesystems = ["ntfs"];

  networking.hostName = "Wu"; # Define your hostname.

  environment.systemPackages = with pkgs; [
  ];

  # Disable NetworkManager's internal DNS resolution
  networking.networkmanager.dns = "none";

  networking.nameservers = [
    "192.168.178.202"
    "fe80::be24:11ff:fe84:ac69"
  ];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  system.stateVersion = "24.11"; # Did you read the comment?
}
