let
  Theseus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJwouafzGDRGeMJQbm9ME/1CSkXicdL7TthJjWkhyLYd nick@Theseus";
  Hermes = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF6WDX5De9IY7cfl4XZg6mWLVGDQli5/F2DNecZvs7gk nick@Hermes";
  Iris = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPWmvZWyYxj3QTHYfNaLXHYjAU8HlwjAL/zH09FCTw8g nick@Iris";
in {
  "smb.age".publicKeys = [Theseus Hermes];
  "vaultwarden-token.age".publicKeys = [Hermes];
  "navidrome-env.age".publicKeys = [Hermes];
  "wireguard-conf.age".publicKeys = [Hermes];
  "cloudflare.age".publicKeys = [Hermes];
  "cloudflare-cert.age".publicKeys = [Hermes];
  "cloudflare-creds.age".publicKeys = [Hermes];
  "pihole-token.age".publicKeys = [Hermes];
  "homarr-token.age".publicKeys = [Hermes];
}
