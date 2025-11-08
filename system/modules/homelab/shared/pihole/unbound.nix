{
  config,
  lib,
  ...
}: {
  services = {
    unbound = {
      enable = true;
      settings = {
        server = {
          interface = ["127.0.0.1"];
          port = 5335;
          access-control = ["127.0.0.1 allow"];

          # Hardening & security
          harden-glue = true;
          harden-dnssec-stripped = true;
          harden-referral-path = true;
          harden-algo-downgrade = true;
          use-caps-for-id = false;

          # Performance tuning
          cache-min-ttl = 300; # Don't cache negative responses too long
          cache-max-ttl = 86400; # Max 1 day
          prefetch = true;
          serve-expired = true;
          msg-cache-size = "16m"; # was 8 → 16 MB
          rrset-cache-size = "32m"; # was 16 → 32 MB
          key-cache-size = "16m";
          neg-cache-size = "8m";

          # Reduce latency
          edns-buffer-size = 1232;
          msg-buffer-size = 65552;
          so-rcvbuf = "4m";
          so-sndbuf = "4m";

          # Privacy
          hide-identity = true;
          hide-version = true;
          qname-minimisation = true;

          # Optional: aggressive NSEC (faster negative caching)
          aggressive-nsec = true;
        };

        forward-zone = [
          {
            name = ".";
            forward-tls-upstream = true;
            forward-addr = [
              # Quad9 (DNS-over-TLS)
              "9.9.9.9@853#dns.quad9.net"
              "149.112.112.112@853#dns.quad9.net"
              "2620:fe::fe@853#dns.quad9.net"
              "2620:fe::9@853#dns.quad9.net"
            ];
          }
        ];
      };
    };
  };
}
