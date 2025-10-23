{
  nixarr,
  pkgs,
  lib,
  ...
}: {
  nixarr = {
    enable = true;

    mediaDir = "/mnt/share/media/nixarr";
    stateDir = "/data/media/.state/nixarr";

    vpn = {
      enable = true;
      wgConf = "/data/.secret/wg.conf";
    };

    jellyfin = {
      enable = true;
      openFirewall = true;
      expose.https = {
        enable = false;
      };
    };

    transmission = {
      enable = true;
      vpn.enable = true;
      flood.enable = true;
      extraSettings = {
        # Bind to the VPN interface's local IP
        bind-address-ipv4 = ""; # wg-br local IP
        bind-address-ipv6 = "0.0.0.0"; # disable IPv6 binding
        network-interface = "wg-br";

        # Disable any potential IPv6 peer leaks
        utp-enabled = true; # only over IPv4
        dht-enabled = true;
      };
    };

    # It is possible for this module to run the *Arrs through a VPN, but it
    # is generally not recommended, as it can cause rate-limiting issues.
    radarr.enable = true;
    sonarr.enable = true;
    prowlarr.enable = true;
    jellyseerr.enable = true;
    bazarr.enable = false;
    lidarr.enable = false;
    readarr.enable = false;
  };
  networking.firewall.allowedTCPPorts = [7878 8989 9696 5055 9091];
}
