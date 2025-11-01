{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["nick"];
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  services = {
    qemuGuest = {
      enable = false;
    };
    spice-vdagentd = {
      enable = true;
    };
  };
}
