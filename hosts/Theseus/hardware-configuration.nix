{ config, lib, pkgs, modulePath, ...}:
{

    fileSystems."/" =
    { device = "/dev/disk/by-uuid/799f064c-8018-486e-b3c8-06216e71c392";
        fsType = "ext4";
    };

    fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/79F3-64ED";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
    };

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
    
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    
}
