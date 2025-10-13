let
  Theseus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJwouafzGDRGeMJQbm9ME/1CSkXicdL7TthJjWkhyLYd nick@Theseus";
in {
  "smb.age".publicKeys = [Theseus];
  "vaultwarden-token.age".publicKeys = [Theseus];
  "wireguard-key.age".publicKeys = [Theseus];
  "wireguard-address.age".publicKeys = [Theseus];
  "navidrome-env.age".publicKeys = [Theseus];
  "wireguard-conf.age".publicKeys = [Theseus];
}
