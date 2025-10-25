{lib, ...}: {
  services = {
    pihole-web = {
      enable = true;
      ports = ["8081r" "6443s"];
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
          showDNSSEC = true;
          analyzeOnlyAandAAAA = false;
          replyWhenBusy = "ALLOW";
          blockTTL = 2;
          expandHosts = false;
          domain = "lan";

          interface = "eno1";
          listeningMode = "All";
          queryLogging = true;

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
          domain = "pi.hole2";
          port = lib.mkForce "8081o,[::]:8081o,6443os,[::]:6443os";
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
