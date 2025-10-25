{pkgs, ...}: let
  syncScript = pkgs.writeFile {
    name = "sync-npm-to-lxc.sh";
    text = ''
      #!/run/current-system/sw/bin/bash

      # Configuration
      SOURCE_DIR="/data/nginx-proxy-manager"
      CERT_SOURCE_DIR="/data/ngins-proxy-manager/letsencrypt"
      DEST_HOST="root@192.168.178.203"
      DEST_DATA_DIR="/data"
      DEST_CERT_DIR="/etc/letsencrypt"
      SSH_KEY="/home/nick/.ssh/id_ed25519"
      LOG_FILE="/var/log/npm-sync.log"

      # Ensure log file exists
      ${pkgs.coreutils}/bin/touch "$LOG_FILE"
      ${pkgs.coreutils}/bin/chmod 644 "$LOG_FILE"

      # Sync database.sqlite
      ${pkgs.rsync}/bin/rsync -avz --progress "$SOURCE_DIR/database.sqlite" -e "${pkgs.openssh}/bin/ssh -i $SSH_KEY" "$DEST_HOST:$DEST_DATA_DIR/database.sqlite" >> "$LOG_FILE" 2>&1
      if [ $? -eq 0 ]; then
        echo "$(${pkgs.coreutils}/bin/date): Successfully synced database.sqlite" >> "$LOG_FILE"
      else
        echo "$(${pkgs.coreutils}/bin/date): Failed to sync database.sqlite" >> "$LOG_FILE"
        exit 1
      fi

      # Sync nginx/proxy_host/
      ${pkgs.rsync}/bin/rsync -avz --progress "$SOURCE_DIR/nginx/proxy_host/" -e "${pkgs.openssh}/bin/ssh -i $SSH_KEY" "$DEST_HOST:$DEST_DATA_DIR/nginx/proxy_host/" >> "$LOG_FILE" 2>&1
      if [ $? -eq 0 ]; then
        echo "$(${pkgs.coreutils}/bin/date): Successfully synced nginx/proxy_host/" >> "$LOG_FILE"
      else
        echo "$(${pkgs.coreutils}/bin/date): Failed to sync nginx/proxy_host/" >> "$LOG_FILE"
        exit 1
      fi

      # Sync certificates to /etc/letsencrypt/
      ${pkgs.rsync}/bin/rsync -avz --copy-links --progress "$CERT_SOURCE_DIR/" -e "${pkgs.openssh}/bin/ssh -i $SSH_KEY" "$DEST_HOST:$DEST_CERT_DIR/" >> "$LOG_FILE" 2>&1
      if [ $? -eq 0 ]; then
        echo "$(${pkgs.coreutils}/bin/date): Successfully synced certificates to /etc/letsencrypt/" >> "$LOG_FILE"
      else
        echo "$(${pkgs.coreutils}/bin/date): Failed to sync certificates" >> "$LOG_FILE"
        exit 1
      fi

      # Set permissions on Proxmox LXC
      ${pkgs.openssh}/bin/ssh -i "$SSH_KEY" "$DEST_HOST" << 'EOF'
        chown www-data:www-data /data/database.sqlite
        chmod 644 /data/database.sqlite
        chown -R www-data:www-data /data/nginx/
        chmod -R 644 /data/nginx/proxy_host/*.conf
        chown -R www-data:www-data /etc/letsencrypt
        chmod -R 600 /etc/letsencrypt/archive
        chmod -R 600 /etc/letsencrypt/live
        chown -R www-data:www-data /data/logs
        chmod -R 644 /data/logs/
      EOF
      if [ $? -eq 0 ]; then
        echo "$(${pkgs.coreutils}/bin/date): Successfully set permissions" >> "$LOG_FILE"
      else
        echo "$(${pkgs.coreutils}/bin/date): Failed to set permissions" >> "$LOG_FILE"
        exit 1
      fi

      # Restart services on Proxmox LXC
      ${pkgs.openssh}/bin/ssh -i "$SSH_KEY" "$DEST_HOST" "systemctl restart openresty && systemctl restart npm" >> "$LOG_FILE" 2>&1
      if [ $? -eq 0 ]; then
        echo "$(${pkgs.coreutils}/bin/date): Successfully restarted openresty and npm services" >> "$LOG_FILE"
      else
        echo "$(${pkgs.coreutils}/bin/date): Failed to restart services" >> "$LOG_FILE"
        exit 1
      fi

      exit 0
    '';
  };
in {
  # Ensure rsync and openssh are available
  environment.systemPackages = with pkgs; [rsync openssh];

  # Systemd service for syncing
  systemd.services.npm-sync = {
    description = "Sync Nginx Proxy Manager files to Proxmox LXC";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash ${syncScript}";
      User = "root"; # Run as root to access /home/nick/.ssh/id_ed25519
    };
  };

  # Systemd timer for hourly execution
  systemd.timers.npm-sync = {
    description = "Timer for syncing Nginx Proxy Manager files to Proxmox LXC";
    wantedBy = ["timers.target"];
    timerConfig = {
      OnCalendar = "hourly"; # Runs every hour
      Persistent = true; # Runs missed jobs after reboot
      Unit = "npm-sync.service";
    };
  };

  # Ensure log directory exists
  systemd.tmpfiles.rules = [
    "d /var/log 0755 root root -"
    "f /var/log/npm-sync.log 0644 root root -"
  ];
}
