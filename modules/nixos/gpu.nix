{
  {pkgs, ...}:
  hardware.graphics = {
    enable = true;
    emable32Bit = true;
  };
  
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

  };
}
