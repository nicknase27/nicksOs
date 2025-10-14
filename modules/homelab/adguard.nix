{...}: {
  services.adguardhome = {
    enable = true;
    openFirewall = true;
    mutableSettings = true;
    settings = {
      http = {
        # You can select any ip and port, just make sure to open firewalls where needed
        address = "127.0.0.1:3003";
      };
      dns = {
        upstream_dns = [
          # Example config with quad9
          "9.9.9.9"
          "149.112.112.112"
          "https://dns.quad9.net/dns-query"
          # Uncomment the following to use a local DNS service (e.g. Unbound)
          # Additionally replace the address & port as needed
          # "127.0.0.1:5335"
        ];
      };
      filtering = {
        protection_enabled = true;
        filtering_enabled = true;

        parental_enabled = false; # Parental control-based DNS requests filtering.
        safe_search = {
          enabled = false; # Enforcing "Safe search" option for search engines, when possible.
        };
      };
      # The following notation uses map
      # to not have to manually create {enabled = true; url = "";} for every filter
      # This is, however, fully optional
      filters =
        map (url: {
          enabled = true;
          url = url;
        }) [
          "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
          "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn-only/hosts"
        ];
    };
  };

  networking.firewall = {
    allowedTCPPorts = [53];
    allowedUDPPorts = [53];
  };
}
