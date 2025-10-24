{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: let
  smbCredFile = config.age.secrets.smb.path; # This will be /run/agenix/smb-cred or similar
in {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod"];
      kernelModules = ["amdgpu"];
    };
    kernelModules = ["kvm-amd" "amdgpu"];
    extraModulePackages = [];
    kernelParams = [
      "loglevel=3"
      "amdgpu.gpu_recovery=1"
      "amdgpu.ppfeaturemask=0xfffd3fff"
    ];
  };

  services = {
    xserver = {
      enable = true;
      videoDrivers = ["amdpu"];
    };
  };

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
    options = ["credentials=${config.age.secrets.smb.path}" "x-systemd.automount" "nofail" "noperm" "x-systemd.after=network-online.target" "x-systemd.automount-options=--timeout=30" "_netdev"];
  };

  systemd.network.wait-online.enable = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = true;
}
