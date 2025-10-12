{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./secrets.nix
    ../common.nix

    (import ../../modules/user/wms/wayland {selected = ["hyprland"];})
    (import ../../modules/user/terminals {selected = ["kitty"];})
    (import ../../modules/system/gpu {selected = ["amd"];})

    ../../modules/user/media/default.nix
    ../../modules/system/default.nix
    ../../modules/user/gaming/default.nix
  ];

  networking = {
    hostName = "Theseus";
    useDHCP = lib.mkForce false;
    dhcpcd.enable = lib.mkForce false;
    nameservers = [
      "192.168.178.202"
      "fe80::be24:11ff:fe84:ac69"
    ];
  };

  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    vscodium
  ];
}
