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
    kernelModules = ["kvm-intel"];
    extraModulePackages = [];
    kernelParams = [
      "loglevel=3"
    ];
    kernel = {
      sysctl = {
        "net.ipv4.ip_forward" = lib.mkForce true;
        "net.ipv6.conf.all.forwarding" = lib.mkForce true;
      };
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/103cfc98-8d13-40a9-98b7-4b977cbfd05d";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/4959-0930";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/82d565ba-89b2-4bf9-a19b-e00b16f289e1";}
  ];

  # fileSystems."/mnt/storage" = {
  #   device = "//192.168.178.3/tank1";
  #   fsType = "cifs";
  #   options = ["credentials=${config.age.secrets.smb.path}" "x-systemd.automount" "nofail" "noperm" "x-systemd.after=network-online.target" "x-systemd.automount-options=--timeout=30" "_netdev"];
  # };
  
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      libva-vdpau-driver
      libvdpau-va-gl
      intel-compute-runtime
      vpl-gpu-rt
    ];
  };

  systemd.network.wait-online.enable = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = true;
}
