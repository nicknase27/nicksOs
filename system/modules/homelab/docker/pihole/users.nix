{
  pkgs,
  config,
  lib,
  ...
}: {
  users = {
    users.keepalived_script = {
      isSystemUser = true;
      group = "keepalived_script";
      description = "Unprivileged user for Keepalived health scripts";
      shell = "/run/current-system/sw/bin/nologin";
    };
    groups = {
      keepalived_script = {};
    };
  };
}
