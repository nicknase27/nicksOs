{...}: {
  services = {
    traefik = {
      dynamicConfigOptions = {
        http = {
          services = {
            dash = {
              loadBalancer = {
                servers = [
                  {url = "http://192.168.178.210:7575";}
                ];
              };
            };
            dns1 = {
              loadBalancer = {
                servers = [
                  {url = "http://192.168.178.250:8085/";}
                ];
              };
            };
            dns2 = {
              loadBalancer = {
                servers = [
                  {url = "http://192.168.178.202:8080/admin";}
                ];
              };
            };
            jellyseerr = {
              loadBalancer = {
                servers = [
                  {url = "http://192.168.178.210:5055";}
                ];
              };
            };
            music = {
              loadBalancer = {
                servers = [
                  {url = "http://192.168.178.210:4533";}
                ];
              };
            };
            prowlarr = {
              loadBalancer = {
                servers = [
                  {url = "http://192.168.178.210:9696";}
                ];
              };
            };
            pxmx = {
              loadBalancer = {
                servers = [
                  {url = "http://192.168.178.200:8006";}
                ];
              };
            };
            radarr = {
              loadBalancer = {
                servers = [
                  {url = "http://192.168.178.210:7878";}
                ];
              };
            };
            sonarr = {
              loadBalancer = {
                servers = [
                  {url = "http://192.168.178.210:8989";}
                ];
              };
            };
            storage = {
              loadBalancer = {
                servers = [
                  {url = "http://192.168.178.210:80";}
                ];
              };
            };
            torrent = {
              loadBalancer = {
                servers = [
                  {url = "http://192.168.178.210:9091";}
                ];
              };
            };
            vault = {
              loadBalancer = {
                servers = [
                  {url = "http://192.168.178.210:8222";}
                ];
              };
            };
            watch = {
              loadBalancer = {
                servers = [
                  {url = "http://192.168.178.210:8096";}
                ];
              };
            };
            grafana = {
              loadBalancer = {
                servers = [
                  {url = "http://192.168.178.215:3000";}
                ];
              };
            };
            prometheus = {
              loadBalancer = {
                servers = [
                  {url = "http://192.168.178.215:9001";}
                ];
              };
            };
          };
        };
      };
    };
  };
}
