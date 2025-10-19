{...}: {
  programs = {
    eza = {
      enable = true;
      enableFishIntegration = true;
      colors = "always";
      icons = "auto";
      extraOptions = [
        "--all"
        "--git-repos-no-status"
        "--no-time"
        "--no-filesize"
        "--no-user"
        "--no-permissions"
      ];
    };
  };
}
