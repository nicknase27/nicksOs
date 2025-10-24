{
  pkgs,
  config,
  lib,
  ...
}: {
  services = {
    keepalived = {
      enable = true;
      openFirewall = true;
      extraConfig = ''
          global_defs {
              router_id HOST1
              enable_script_security
          }

          vrrp_script chk_pihole {
            script "/etc/keepalived/check_pihole.sh"
            interval 5
            fall 2
            rise 1
        }

          # VRRP instance for IPv4
          vrrp_instance VI_1_IPV4 {
              state MASTER
              interface eno1
              virtual_router_id 51
              priority 150
              advert_int 1

              unicast_src_ip 192.168.178.210
              unicast_peer {
                  192.168.178.202
              }

              virtual_ipaddress {
                  192.168.178.250/24
              }

              authentication {
                  auth_type PASS
                  auth_pass AdfG4IJK
              }

              track_script {
                chk_pihole
              }
          }

          # VRRP instance for IPv6
          vrrp_instance VI_1_IPV6 {
              state MASTER
              interface eno1
              virtual_router_id 52
              priority 150
              advert_int 1

              unicast_src_ip fda0:be70:c013:0::210
              unicast_peer {
                  fda0:be70:c013:0:be24:11ff:fe84:ac69
              }

              virtual_ipaddress {
                  fda0:be70:c013::250/64
              }

              #authentication {
              #    auth_type PASS
              #    auth_pass AdfG4IJK
              #}

              track_script {
                chk_pihole
              }
          }
      '';
    };
  };
}
