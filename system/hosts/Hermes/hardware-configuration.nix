{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [];
  boot.kernelParams = [
    "loglevel=3"
  ];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/055ae256-dfaf-4957-8e92-2a494ffe37a3";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/6E0B-096A";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/3aaad780-66db-454e-84c5-e32ba0541d46";
    fsType = "btrfs";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/a111746d-13c8-4b75-a5b9-85235f593a63";}
  ];

  fileSystems."/mnt/share" = {
    device = "//192.168.178.201/share";
    fsType = "cifs";
    options = ["credentials=${config.age.secrets.smb.path}" "x-systemd.automount" "nofail" "noperm" "x-systemd.after=network-online.target" "x-systemd.automount-options=--timeout=30" "_netdev"];
  };

  systemd.network.wait-online.enable = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = true;
}
