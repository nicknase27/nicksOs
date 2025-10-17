{
  config,
  pkgs,
  ...
}: {
  imports = [
  ];

  home.packages = with pkgs; [
  ];

  programs.fish = {
    functions = {
      rebuild = {
        body = "sudo nixos-rebuild switch --flake ~/nicksOs/system/#Iris";
      };
      swap = {
        body = "home-manager switch --flake ~/nicksOs/home/#nick@Iris";
      };
    };
  };
}
