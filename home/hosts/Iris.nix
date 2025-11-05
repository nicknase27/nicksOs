{
  config,
  pkgs,
  hostname,
  ...
}: {
  imports = [
    ../profiles/server.nix
  ];

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
