{
  nixarr,
  pkgs,
  lib,
  ...
}: {
  nixarr = {
    enable = true;

    mediaDir = "/mnt/nixarr";
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
      peerPort = 50000;
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

    radarr = {
      enable = true;
    };

    sonarr = {
      enable = true;
    };

    prowlarr = {
      enable = true;
    };

    jellyseerr = {
      enable = true;
    };

    # It is possible for this module to run the *Arrs through a VPN, but it
    # is generally not recommended, as it can cause rate-limiting issues.
    bazarr.enable = false;
    lidarr.enable = false;
    readarr.enable = false;
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "nicknase@nicknase27.com";
  };
}
