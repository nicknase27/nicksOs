{
  pkgs,
  lib,
  ...
}: {
  # Host-specific configurations for Hermes, my homelab.
  imports = [
    ../../modules/profiles/server.nix
    ../../modules/homelab.nix
    #../../modules/homelab/native/wireguard/peer.nix

    #../../modules/user/apps/misc.nix
  ];

  services.getty.autologinUser = "nick";

  # Optional: disable virtual consoles you don’t need
  services.getty.helpLine = lib.mkForce "";
}
