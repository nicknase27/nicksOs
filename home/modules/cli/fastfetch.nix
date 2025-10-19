{...}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        padding = {
          right = 1;
        };
      };
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "display"
        "wm"
        "font"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        "swap"
        "localip"
      ];
    };
  };
}
