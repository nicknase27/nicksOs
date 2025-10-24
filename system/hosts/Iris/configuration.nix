{
  config,
  pkgs,
  lib,
  agenix,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disko.nix
    ./profile.nix
    ../common.nix
  ];

  users.users = {
    nick = {
      packages = with pkgs; [
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    curl
    gitMinimal
    neovim
  ];

  networking = {
    hostName = "Iris";
    useDHCP = lib.mkForce false;
  };

  networking.firewall.allowedUDPPorts = [51820];

  networking.wireguard.interfaces.wg0 = {
    ips = ["10.10.0.1/24"];
    listenPort = 51820;
    privateKeyFile = "/etc/wireguard/privatekey";

    peers = [
      #{
      #  # Theseus
      #  publicKey = "Q8YBv2FMPLN5+LQ6kcbxuHPvbvrgwnx7GzSyMRfnUGg=";
      #  allowedIPs = ["10.10.0.2/32" "192.168.178.0/24"];
      #}
      {
        # Hermes
        publicKey = "1FPKicG6SbiSTM1NgjO4OMTSe6GDlt8NbaIKZfv/vW8=";
        allowedIPs = ["10.10.0.2/32" "192.168.178.0/24"];
      }
      {
        # Pixel
        publicKey = "KxHXmNxBdjMHsDJa0VEbf5hKQgephvDYcx4X875Qzk8=";
        allowedIPs = ["10.10.0.3/32"];
      }
      {
        # iPad
        publicKey = "ABpWXexhcoYRjtA+EY13OOuZRHoc/66BBgJ6CUTe0kU=";
        allowedIPs = ["10.10.0.4/32"];
      }
    ];
  };

  # Enable IP forwarding (for routing between peers)
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = true;
    "net.ipv6.conf.all.forwarding" = true;
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    flake = "/home/nick/nicksOs/system#Iris";
    dates = "monthly";
  };
}
