{
  config,
  pkgs,
  lib,
  ...
}: {
  services = {
    fwupd = {
      enable = true;
    };
    fstrim = {
      enable = true;
    };
    openssh = {
      enable = true;
      openFirewall = true;
    };
  };
}
