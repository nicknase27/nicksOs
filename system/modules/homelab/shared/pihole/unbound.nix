{
  config,
  lib,
  ...
}: {
  services = {
    unbound = {
      enable = false;
      settings = {
        server = {
          interface = ["127.0.0.1"];
          port = 5335;
          access-control = ["127.0.0.1 allow"];
          # Based on recommended settings in https://docs.pi-hole.net/guides/dns/unbound/#configure-unbound
          harden-glue = true;
          harden-dnssec-stripped = true;
          use-caps-for-id = false;
          prefetch = true;
          cache-min-ttl = 0;
          serve-expired = true;
          msg-cache-size = 8;
          rrset-cache-size = 16;
          edns-buffer-size = 1232;

          # Custom settings
          hide-identity = true;
          hide-version = true;
        };
        forward-zone = [
          # Example config with quad9
          {
            name = ".";
            forward-addr = [
              "1.1.1.1@853#cloudflare-dns.com"
              "2606:4700:4700::1111@853#cloudflare-dns.com"
            ];
            forward-tls-upstream = true; # Protected DNS
          }
        ];
      };
    };
  };
}
