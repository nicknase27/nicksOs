let
  Theseus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJwouafzGDRGeMJQbm9ME/1CSkXicdL7TthJjWkhyLYd nick@Theseus";
in {
  "smb.age".publicKeys = [Theseus];
  "vaultwarden-token.age".publicKeys = [Theseus];
  "wireguard-key.age".publicKeys = [Theseus];
  "wireguard-address.age".publicKeys = [Theseus];
  "lastfm-apikey.age".publicKeys = [Theseus];
  "lastfm-secret.age".publicKeys = [Theseus];
  "spotify-id.age".publicKeys = [Theseus];
  "spotify-secret.age".publicKeys = [Theseus];
  "navidrome-env.age".publicKeys = [Theseus];
}
