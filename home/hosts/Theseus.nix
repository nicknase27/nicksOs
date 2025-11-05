{
  config,
  pkgs,
  hostname,
  ...
}: {
  imports = [
    ../profiles/desktop.nix
  ];

  home.packages = with pkgs; [
    yazi
    playerctl
    feishin
    ungoogled-chromium
    qutebrowser
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
    size = 26;
  };

  programs.fish = {
    functions = {
      rebuild = {
        body = "sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/nicksOs/system/#${hostname}";
      };
      swap = {
        body = "home-manager switch --flake ${config.home.homeDirectory}/nicksOs/home/#nick@${hostname}";
      };
    };
  };
}
