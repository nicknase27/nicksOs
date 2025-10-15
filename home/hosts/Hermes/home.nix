{
  config,
  pkgs,
  ...
}: {
  imports = [
  ];

  programs.fish = {
    functions = {
      rebuild = {
        body = "sudo nixos-rebuild switch --flake ~/nicksOs/system/#Hermes";
      };
      swap = {
        body = "home-manager switch --flake ~/nicksOs/home/#nick@Hermes";
      };
    };
  };
}
