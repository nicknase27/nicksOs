{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/apps/vesktop.nix
    ../../modules/apps/kitty.nix
    ../../modules/apps/mako.nix
    ../../modules/apps/waybar.nix
    ../../modules/apps/rofi.nix
    ../../modules/apps/hyprland.nix
  ];

  home.packages = with pkgs; [
    playerctl
    feishin
    ungoogled-chromium
    qutebrowser
  ];

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
