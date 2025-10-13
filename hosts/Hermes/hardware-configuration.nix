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
    device = "/dev/disk/by-uuid/0bf56dc0-0612-4b7c-b280-bebce5a9bf8b";
    fsType = "btrfs";
    options = ["subvol=@"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/EFC5-2923";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/3aaad780-66db-454e-84c5-e32ba0541d46";
    fsType = "btrfs";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/f474fffa-0bde-4bca-8149-d95d3e091516";}
  ];

  fileSystems."/mnt/share" = {
    device = "//192.168.178.201/share";
    fsType = "cifs";
    options = [
      "x-systemd.automount"
      "nofail"
      "noauto"
      "x-systemd.idle-timeout=60"
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"
      "credentials=/etc/credentials.txt"
      "vers=3.0"
      "iocharset=utf8"
      "file_mode=0777"
      "dir_mode=0777"
    ];
  };

  fileSystems."/mnt/music" = {
    device = "//192.168.178.201/share/media/music";
    fsType = "cifs";
    options = [
      "x-systemd.automount"
      "nofail"
      "noauto"
      "x-systemd.idle-timeout=60"
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"
      "credentials=/etc/credentials.txt"
      "vers=3.0"
      "iocharset=utf8"
      "file_mode=0777"
      "dir_mode=0777"
    ];
  };

  fileSystems."/mnt/nixarr" = {
    device = "//192.168.178.201/share/nixarr";
    fsType = "cifs";
    options = [
      "x-systemd.automount"
      "nofail"
      "noauto"
      "x-systemd.idle-timeout=60"
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"
      "credentials=/etc/credentials.txt"
      "vers=3.0"
      "iocharset=utf8"
      "file_mode=0777"
      "dir_mode=0777"
    ];
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = true;
}
