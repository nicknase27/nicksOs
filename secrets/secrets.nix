let
  Theseus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJwouafzGDRGeMJQbm9ME/1CSkXicdL7TthJjWkhyLYd nick@Theseus";
in {
  "credentials.age".publicKeys = [Theseus];
}
