{lib, ...}: {
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [53 8080 8443];
    allowedUDPPorts = [53];
    # If you use Pi-hole's DHCP server feature, also add:
    # allowedUDPPorts = [ 53 67 ];
  };

  services = {
    pihole-web = {
      enable = true;
      ports = ["8080r" "8443s"];
    };

    pihole-ftl = {
      enable = true;

      settings = {
        dns = {
          upstreams = ["127.0.0.1#5335"];

          # Use non-default values / custom behavior
          CNAMEdeepInspect = true;
          blockESNI = true;
          EDNS0ECS = true;
          ignoreLocalhost = true;
          dnssec = true;
          showDNSSEC = true;
          analyzeOnlyAandAAAA = false;
          replyWhenBusy = "ALLOW";
          blockTTL = 2;
          expandHosts = false;
          domain = "lan";
          interface = "eno1";
          listeningMode = "All";
          queryLogging = true;
          revServers = [
            "true,192.168.178.0/24,192.168.178.1,fritz.box"
          ];

          cache = {
            size = 10000;
            optimizer = 3600;
            upstreamBlockedTTL = 86400;
          };

          blocking = {
            mode = "NULL";
            edns = "TEXT";
          };

          specialDomains = {
            mozillaCanary = true;
            iCloudPrivateRelay = true;
            designatedResolver = true;
          };

          rateLimit = {
            count = 1000;
            interval = 60;
          };

          hosts = [
            "192.168.178.250 dns.nicknase27.com"
            "192.168.178.245 dns1.nicknase27.com"
            "192.168.178.245 dns2.nicknase27.com"
            "192.168.178.245 npmx.nicknase27.com"
            "192.168.178.210 npmx1.nicknase27.com"
            "192.168.178.203 npmx2.nicknase27.com"
            "192.168.178.245 jellyseerr.nicknase27.com"
            "192.168.178.245 music.nicknase27.com"
            "192.168.178.245 prowlarr.nicknase27.com"
            "192.168.178.245 radarr.nicknase27.com"
            "192.168.178.245 sonarr.nicknase27.com"
            "192.168.178.245 torrent.nicknase27.com"
            "192.168.178.245 watch.nicknase27.com"
            "192.168.178.245 vault.nicknase27.com"
            "192.168.178.245 storage.nicknase27.com"
            "192.168.178.245 pxmx.nicknase27.com"
            "192.168.178.245 hermes.lan"
            "192.168.178.20 theseus.lan"
            "192.168.178.245 dash.nicknase27.com"
            "192.168.178.1 fritz.box"
          ];
        };

        ntp = {
          sync = {
            active = true;
            server = "pool.ntp.org";
            interval = 3600;
            count = 8;
            rtc = {set = false;};
          };
        };

        resolver = {
          resolveIPv4 = true;
          resolveIPv6 = true;
          refreshNames = "IPV4_ONLY";
        };

        webserver = {
          domain = lib.mkForce "pi.hole";
          port = lib.mkForce "8080o,[::]:8080o,8443os,[::]:8443os";
          paths = {
            webhome = lib.mkForce "/admin/";
          };
        };
      };

      lists = [
        {
          url = "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts";
          enabled = true;
          type = "block";
          description = "Default block list";
        }
        {
          url = "https://raw.githubusercontent.com/MoralCode/pihole-antitelemetry/main/telemetry-domains.txt";
          enabled = true;
          type = "block";
          description = "Block Telemetry";
        }
      ];
    };
  };
}
