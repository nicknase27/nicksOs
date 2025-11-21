{
  config,
  pkgs,
  hostname,
  ...
}: {
  imports = [
    ../profiles/server.nix
  ];
}
