# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  boot.initrd.availableKernelModules = ["ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  #fileSystems."/" =
  #  { device = "/dev/disk/by-uuid/799f064c-8018-486e-b3c8-06216e71c392";
  #    fsType = "ext4";
  #  };

  #fileSystems."/boot" =
  #  { device = "/dev/disk/by-uuid/79F3-64ED";
  #    fsType = "vfat";
  #    options = [ "fmask=0077" "dmask=0077" ];
  #  };

  #swapDevices = [ ];

  fileSystems."/mnt/samsung" = {
    device = "/dev/disk/by-uuid/A0D2555DD255392C";
    fsType = "ntfs";
    options = ["rw" "nofail" "uid=1000" "gid=1000" "noatime"];
  };

  fileSystems."/mnt/windows" = {
    device = "/dev/disk/by-uuid/E822CF1022CEE324";
    fsType = "ntfs";
    options = ["rw" "nofail" "uid=1000" "gid=1000" "noatime"];
  };
  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.ens1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
