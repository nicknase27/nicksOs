{
  config,
  pkgs,
  lib,
  agenix,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./secrets.nix

    ../../modules/homelab/shared
    ../../modules/homelab/Hermes
  ];

  users.users = {
    nick = {
      packages = with pkgs; [
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    sqlite
  ];

  networking = {
    hostName = "Hermes";
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    flake = "/home/nick/nicksOs/system/#Hermes";
    dates = "monthly";
  };

  services.displayManager = {
    sddm = {
      enable = lib.mkForce false;
      wayland.enable = lib.mkForce false;
    };
  };

    systemd.services.vaultwarden-backup = {
    description = "Backup Vaultwarden SQLite DB and copy to NAS";
    serviceConfig = {
      Type = "oneshot";
      # Optional: run as the vaultwarden user if the db is not readable by root
      # User = "vaultwarden";
      ExecStart = let
        backupDir = "/home/nick/backups";
        nasDir = "/mnt/storage";
      in ''
        #!/run/current-system/sw/bin/bash
        set -euo pipefail

        # Create backup directory if it doesn't exist
        mkdir -p ${backupDir}

        # Create dated backup
        backup_file="${backupDir}/db-$(date '+%Y%m%d-%H%M%S').sqlite3"
        ${pkgs.sqlite}/bin/sqlite3 /var/lib/vaultwarden/db.sqlite3 ".backup '$backup_file'"

        # Copy all .sqlite3 backups to NAS (or just the new one if you prefer)
        ${pkgs.rsync}/bin/rsync -avh --delete "${backupDir}/" "${nasDir}/vaultwarden-backups/"

        # Optional: keep only last N backups locally
        # find ${backupDir} -name 'db-*.sqlite3' -type f | sort | head -n -10 | xargs rm -f
      '';
    };
  };

  systemd.timers.vaultwarden-backup = {
    description = "Run Vaultwarden backup every day at midnight";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "*-*-* 15:11:00";  # Daily at midnight
      Persistent = true;              # Run missed jobs after reboot/sleep
      RandomizedDelaySec = "5m";      # Slight randomization to avoid thundering herd
    };
  };

}
