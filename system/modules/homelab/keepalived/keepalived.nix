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
      extraGlobalDefs = ''
        router_id HOST1
        enable_script_security
      '';
    };
  };
}
