let
  Theseus = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJwouafzGDRGeMJQbm9ME/1CSkXicdL7TthJjWkhyLYd nick@Theseus"];
  Hermes = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF6WDX5De9IY7cfl4XZg6mWLVGDQli5/F2DNecZvs7gk nick@Hermes"];
  Apollo = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB99y4R4E+eaal/xleWGpgQjVhiUf7ouQnsn6pJGFO8K nick@Apollo"];
  Iris = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPWmvZWyYxj3QTHYfNaLXHYjAU8HlwjAL/zH09FCTw8g nick@Iris"];
  Homelab = Hermes ++ Apollo;
in {
  "smb.age".publicKeys = Theseus ++ Homelab;
  "smb2.age".publicKeys = Theseus ++ Homelab;
  "vaultwarden-token.age".publicKeys = Homelab;
  "navidrome-env.age".publicKeys = Homelab;
  "wireguard-conf.age".publicKeys = Homelab;
  "cloudflare.age".publicKeys = Homelab;
  "cloudflare-cert.age".publicKeys = Homelab;
  "cloudflare-creds.age".publicKeys = Homelab;
  "pihole-token.age".publicKeys = Homelab;
  "homarr-token.age".publicKeys = Homelab;
}
