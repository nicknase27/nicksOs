{...}: {
  imports = [
    # --- Native --- #
    #./homelab/native/navidrome.nix
    #./homelab/native/vaultwarden.nix
    #./homelab/native/cloudflared.nix
    #./homelab/native/audiobookshelf.nix
    #./homelab/native/nixarr.nix
    ./homelab/native/vscode.nix

    # --- Docker --- #
    #./homelab/docker/docker.nix
    #./homelab/dockerpihole.nix
    #./homelab/dockernginxpm.nix
    #./homelab/dockerhomarr.nix
  ];
}
