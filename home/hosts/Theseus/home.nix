{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/desktop/default.nix
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
        body = "sudo nixos-rebuild switch --flake ~/nicksOs/system/#Theseus";
      };
      swap = {
        body = "home-manager switch --flake ~/nicksOs/home/#nick@Theseus";
      };
    };
  };
}
