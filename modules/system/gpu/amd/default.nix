{ ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  
  ### Kernel settings for amdgpu
  boot.kernelModules = [ "amdgpu" ];
  boot.kernelParams = [
    "loglevel=3" 
    "amdgpu.gpu_recovery=1" 
    "amdgpu.ppfeaturemask=0xfffd3fff"
    ];

  services.xserver.videoDrivers = ["amdgpu"];
}