let
  Theseus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJwouafzGDRGeMJQbm9ME/1CSkXicdL7TthJjWkhyLYd nick@Theseus";
  Iris = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPWmvZWyYxj3QTHYfNaLXHYjAU8HlwjAL/zH09FCTw8g nick@Iris";
in {
  "smb.age".publicKeys = [Theseus];
  "vaultwarden-token.age".publicKeys = [Theseus];
  "navidrome-env.age".publicKeys = [Theseus];
  "wireguard-conf.age".publicKeys = [Theseus];
  "cloudflare.age".publicKeys = [Theseus];
  "cloudflare-cert.age".publicKeys = [Theseus];
  "cloudflare-creds.age".publicKeys = [Theseus];
  "pihole-token.age".publicKeys = [Theseus];
  "homarr-token.age".publicKeys = [Theseus];
}
