{
  pkgs,
  config,
  lib,
  ...
}: {
  networking = {
    wireguard.interfaces.wg0 = {
      ips = ["10.10.0.2/32"];
      privateKeyFile = "/etc/wireguard/privatekey";

      # NAT so LAN devices can reply to Peer C traffic via homelab
      postSetup = ''
        ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 192.168.178.0/24 -o eno1 -j MASQUERADE
        ${pkgs.iptables}/bin/iptables -A FORWARD -i wg0 -j ACCEPT
        ${pkgs.iptables}/bin/iptables -A FORWARD -o wg0 -j ACCEPT
      '';

      postShutdown = ''
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 192.168.178.0/24 -o eno1 -j MASQUERADE
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
    nat = {
      enable = true;
      externalInterface = "eno1";
      internalInterfaces = ["wg0"];
    };
    firewall = {
      allowedUDPPorts = [51820];
      checkReversePath = false;
    };
  };
}
