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
  boot.initrd.kernelModules = ["amdgpu"];
  boot.kernelModules = ["kvm-amd" "amdgpu"];
  boot.kernelParams = [
    "loglevel=3"
    "amdgpu.gpu_recovery=1"
    "amdgpu.ppfeaturemask=0xfffd3fff"
  ];
  boot.extraModulePackages = [];

  services.xserver.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    keyboard.qmk.enable = true;
  };

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

  fileSystems."/mnt/samsung" = {
    device = "/dev/disk/by-uuid/A0D2555DD255392C";
    fsType = "ntfs";
    options = ["rw" "nofail" "uid=1000" "gid=1000" "noatime"];
  };

  fileSystems."/mnt/windows" = {
    device = "/dev/disk/by-uuid/5672AECC72AEAFE3";
    fsType = "ntfs";
    options = ["rw" "nofail" "uid=1000" "gid=1000" "noatime"];
  };

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

  #fileSystems."/mnt/music" = {
  #  device = "//192.168.178.201/share/media/music";
  #  fsType = "cifs";
  #  options = let
  #    # this line prevents hanging on network split
  #    automount_opts = "x-systemd.automount,nofail,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
  #  in ["${automount_opts},credentials=/etc/credentials.txt,uid=navidrome,gid=navidrome"];
  #};

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = true;
}
