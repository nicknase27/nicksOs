{ config, agenix, lib, ...}: {
  {
  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      gluetun = {
        image = "qmcgaw/gluetun:latest";
        environment = {
          VPN_SERVICE_PROVIDER = "mullvad";
          VPN_TYPE = "wireguard";
          WIREGUARD_PRIVATE_KEY = config.age.secrets.wireguard-key.path;
          WIREGUARD_ADDRESSES = config.age.secrets.wireguard-address.path;
          SERVER_COUNTRIES = "Netherlands";
          SERVER_CITIES = "Amsterdam";
        };
        ports = [ "8112:8112" "6881:6881" "6881:6881/udp" ];
        capAdd = [ "NET_ADMIN" ];
      };

      deluge = {
        image = "linuxserver/deluge";
        dependsOn = [ "gluetun" ];
        environment = {
          PUID = "1000";
          PGID = "1000";
        };
        network = "container:gluetun";
        volumes = {
          "/mnt/share/media/downloads:/downloads"
          "/mnt/share/docker/deluge:/config"
        };
      };
    };
  };
}
}
