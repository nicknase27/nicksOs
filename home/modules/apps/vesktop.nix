{pkgs, ...}: {
  programs.vesktop = {
    enable = true;
    settings = {
      appBadge = false;
      arRPC = true;
      checkUpdates = false;
      customTitleBar = false;
      disableMinSize = true;
      minimizeToTray = false;
      tray = true;
      splashTheming = false;
      staticTitle = true;
      hardwareAcceleration = true;
      discordBranch = "stable";
    };
    vencord = {
      settings = {
        autoUpdate = true;
        autoUpdateNotification = true;
        notifyAboutUpdates = false;
        useQuickCss = false;
        disableMinSize = true;
        plugins = {
          FakeNitro.enabled = true;
          NoBlockedMessages.enabled = true;
          WebScreenShareFixes.enabled = true;
          NotificationVolume.enabled = true;
        };
      };
    };
  };
}
