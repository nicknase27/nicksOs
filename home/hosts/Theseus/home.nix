{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/apps/vesktop.nix
  ];

  home.packages = with pkgs; [
    ungoogled-chromium
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
