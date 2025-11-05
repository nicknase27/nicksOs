{
  nixarr,
  pkgs,
  config,
  lib,
  ...
}: {
  nixarr = {
    enable = true;

    mediaDir = "/mnt/share/media/nixarr";
    stateDir = "/data/media/.state/nixarr";

    vpn = {
      enable = true;
      wgConf = "/var/lib/secrets/wg.conf";
      accessibleFrom = [
        "192.168.178.0/24"
      ];
    };

    jellyfin = {
      enable = true;
      openFirewall = true;
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

        # Allow RPC from anywhere (LAN)
        rpc-bind-address = "0.0.0.0";
        rpc-whitelist-enabled = false;

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

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override {enableHybridCodec = true;};
  };
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver # previously vaapiIntel
      libva-vdpau-driver
      libvdpau-va-gl
      intel-compute-runtime # OpenCL filter support (hardware tonemapping and subtitle burn-in)
      vpl-gpu-rt # QSV on 11th gen or newer
      #intel-media-sdk # QSV up to 11th gen
    ];
  };

  networking.firewall.allowedTCPPorts = [7878 8989 9696 5055 9091];
}
