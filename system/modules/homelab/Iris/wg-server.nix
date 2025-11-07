{
  pkgs,
  config,
  lib,
  ...
}: {
  networking = {
    wireguard.interfaces.wg0 = {
      ips = ["10.10.0.1/24"];
      listenPort = 51820;
      privateKeyFile = "/etc/wireguard/privatekey";

      peers = [
        {
          # Apollo
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
    firewall = {
      allowedUDPPorts = [51820];
    };
  };
}
