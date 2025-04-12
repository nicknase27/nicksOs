{
  {...}:

  # Enable steam

  programs = { 
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      };

    gamemode.enable = true;

  };

  # Xbox controller support

  hardware.xone.enable = true;

  # Prismlauncher

  environment.systemPackages = with pkgs; [
    (prismlauncher.override {
      additionalPrograms = [ ffmpeg ];
      jdks = [
        graalvm-ce
	zulu8
	zulu17
	zulu
      ];
    })
  ];

}
