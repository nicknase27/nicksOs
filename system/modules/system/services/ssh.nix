{
  config,
  lib,
  ...
}: let
  mainHost = "Theseus";
in {
  config = lib.mkIf (config.networking.hostName != mainHost) {
    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };

    users.users.nick.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJwouafzGDRGeMJQbm9ME/1CSkXicdL7TthJjWkhyLYd nick@Theseus"
    ];
  };
}
