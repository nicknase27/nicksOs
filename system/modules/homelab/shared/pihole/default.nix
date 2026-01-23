{lib, ...}: {
  imports = [
    ./unbound.nix
  ];

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [53 8085 8443];
    allowedUDPPorts = [53];
  };

  services = {
    pihole-web = {
      enable = true;
      ports = ["8085r" "8443s"];
    };

    pihole-ftl = {
      enable = true;

      settings = {
        dns = {
          upstreams = ["127.0.0.1#5335"]; # ← Points to Unbound

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
            count = 10000;
            interval = 60;
          };

          hosts = [
            "10.0.0.5 dns1.nicknase27.com"
            "10.0.0.5 dns2.nicknase27.com"
            "10.0.0.5 traefik.nicknase27.com"
            "10.0.0.5 request.nicknase27.com"
            "10.0.0.5 music.nicknase27.com"
            "10.0.0.5 prowlarr.nicknase27.com"
            "10.0.0.5 radarr.nicknase27.com"
            "10.0.0.5 sonarr.nicknase27.com"
            "10.0.0.5 torrent.nicknase27.com"
            "10.0.0.5 watch.nicknase27.com"
            "10.0.0.5 vault.nicknase27.com"
            "10.0.0.5 storage.nicknase27.com"
            "10.0.0.5 pve.nicknase27.com"
            "10.0.0.5 dash.nicknase27.com"
            "10.0.0.5 photos.nicknase27.com"
            "10.0.0.5 zerobyte.nicknase27.com"
            "10.0.0.5 remote.nicknase27.com"
            "10.0.0.5 npm.nicknase27.com"
            "10.0.0.5 books.nicknase27.com"
            "10.0.0.5 audbooks.nicknase27.com"
            "192.168.178.20 theseus.lan"
            "192.168.178.210 hermes.lan"
            "192.168.178.215 apollo.lan"
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
          port = lib.mkForce "8085o,[::]:8085o,8443os,[::]:8443os";
          paths = {
            #webhome = lib.mkForce "/admin/";
          };
        };
      };

      lists = [
	# {
	#     url = "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling-porn/hosts";
	#     enabled = true;
	#     type = "block";
	#     description = "";
	# }
	{
	      url = "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts";
	      enabled = true;
	      type = "block";
	}
	{
	      url = "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn-only/hosts";
	      enabled = true;
	      type = "block";
	}
      ];
    };
  };
}
