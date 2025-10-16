{pkgs, ...}: let
  playerctl_status = pkgs.writeShellScriptBin "playerctl_status.sh" ''
    #!/usr/bin/env bash

    MAX_LENGTH=40  # Adjust to fit your bar width
    player_status=$(playerctl status 2>/dev/null)

    if [[ "$player_status" == "Playing" || "$player_status" == "Paused" ]]; then
        title=$(playerctl metadata title 2>/dev/null)
        artist=$(playerctl metadata artist 2>/dev/null)
        full="$title - $artist"

        # Truncate if too long
        full_length=$(expr length "$full")
        if [ "$full_length" -gt "$MAX_LENGTH" ]; then
            full=$(echo "$full" | cut -c1-"$MAX_LENGTH")…
        fi

        echo "{\"text\": \"$full\", \"tooltip\": \"$title - $artist\"}"
    else
        echo "{\"text\": \"No media\"}"
    fi
  '';
in {
  imports = [
    ./waybar/settings.nix
    ./waybar/style.nix
  ];

  programs.waybar = {
    enable = true;
  };

  # Place the script under ~/.config/waybar/scripts/
  home.file.".config/waybar/scripts/playerctl_status.sh".source = "${playerctl_status}/bin/playerctl_status.sh";
}
