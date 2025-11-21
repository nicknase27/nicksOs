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
    qutebrowser
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
    size = 26;
  };
}
