let
  Theseus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJwouafzGDRGeMJQbm9ME/1CSkXicdL7TthJjWkhyLYd nick@Theseus";
in {
  "smb.age".publicKeys = [Theseus];
  "vaultwarden-token.age".publicKeys = [Theseus];
  "navidrome-env.age".publicKeys = [Theseus];
  "wireguard-conf.age".publicKeys = [Theseus];
  "cloudflare.age".publicKeys = [Theseus];
  "cloudflare-cert.age".publicKeys = [Theseus];
  "cloudflare-creds.age".publicKeys = [Theseus];
  "jellyfin-api.age".publicKeys = [Theseus];
  "navidrome-api.age".publicKeys = [Theseus];
  "radarr-api.age".publicKeys = [Theseus];
  "sonarr-api.age".publicKeys = [Theseus];
  "prowlarr-api.age".publicKeys = [Theseus];
  "jellyseerr-api.age".publicKeys = [Theseus];
  "pihole-token.age".publicKeys = [Theseus];
  "homarr-token.age".publicKeys = [Theseus];
}
