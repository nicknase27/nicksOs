{pkgs, ...}: {
  fonts = {
    fontconfig = {
      enable = true;
    };
  };

  stylix = {
    fonts = {
      serif = {
        package = pkgs.libertine; # or whatever font package you want
        name = "Libertine Serif";
      };
      sansSerif = {
        package = pkgs.fira;
        name = "Fira Sans";
      };
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        terminal = 13;
      };
    };
    opacity = {
      terminal = 0.9;
    };
  };
}
