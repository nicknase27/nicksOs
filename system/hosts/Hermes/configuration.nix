{
  config,
  pkgs,
  lib,
  agenix,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./hermes-secrets.nix

    ./profile.nix
  ];

  users.users = {
    nick = {
      packages = with pkgs; [
      ];
    };
  };

  environment.systemPackages = with pkgs; [
  ];

  networking = {
    hostName = "Hermes";
    useDHCP = lib.mkForce false;
  };

  networking.wireguard.interfaces.wg0 = {
    ips = ["10.10.0.2/32"];
    privateKeyFile = "/etc/wireguard/privatekey";

    # NAT so LAN devices can reply to Peer C traffic via homelab
    postSetup = ''
      ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 192.168.178.0/24 -o enp34s0 -j MASQUERADE
      ${pkgs.iptables}/bin/iptables -A FORWARD -i wg0 -j ACCEPT
      ${pkgs.iptables}/bin/iptables -A FORWARD -o wg0 -j ACCEPT
    '';

    postShutdown = ''
      ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 192.168.178.0/24 -o enp34s0 -j MASQUERADE
      ${pkgs.iptables}/bin/iptables -D FORWARD -i wg0 -j ACCEPT
      ${pkgs.iptables}/bin/iptables -D FORWARD -o wg0 -j ACCEPT

    '';

    peers = [
      {
        publicKey = "WHeyTLauAOdX7ASkCmBO5ouI5Ew6aMvsbmBGJhOZkW4=";
        endpoint = "130.61.151.118:51820";
        allowedIPs = ["10.10.0.0/24"]; # access to Peer C and VPS
        persistentKeepalive = 25;
      }
    ];
  };

  # Optional: allow routing to your LAN (192.168.178.0/24)
  networking.nat = {
    enable = true;
    externalInterface = "enp34s0";
    internalInterfaces = ["wg0"];
  };

  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = true;
    "net.ipv6.conf.all.forwarding" = true; # Enable for IPv6 support
  };

  networking.firewall.allowedUDPPorts = [51820];
  networking.firewall.checkReversePath = false;

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    flake = "/home/nick/nicksOs/system/#Hermes";
    dates = "monthly";
  };

  services.displayManager = {
    sddm = {
      enable = lib.mkForce false;
      wayland.enable = lib.mkForce false;
    };
  };
}
