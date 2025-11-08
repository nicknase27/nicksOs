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

  boot = {
    initrd = {
      availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod"];
      kernelModules = [];
    };
    kernelModules = [];
    extraModulePackages = [];
    kernelParams = [
      "loglevel=3"
      "slab_nomerge"
      "page_alloc.shuffle=1"
      "pti=on"
      "spec_store_bypass_disable=on"
      "random.trust_cpu=off"
      "debugfs=off"
      "lockdep=off"
    ];
    kernel = {
      sysctl = {
        "net.ipv4.ip_forward" = lib.mkForce true;
        "net.ipv6.conf.all.forwarding" = lib.mkForce true;
      };
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/055ae256-dfaf-4957-8e92-2a494ffe37a3";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/6E0B-096A";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
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
