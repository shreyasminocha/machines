{
  programs.vesktop = {
    enable = true;
    settings = {
      appBadge = false;
      arRPC = true;
      checkUpdates = false;
      customTitleBar = false;
      disableMinSize = true;
      minimizeToTray = false;
      tray = false;
      hardwareAcceleration = true;
      discordBranch = "stable";
    };
    vencord = {
      #useSystem = true; # broken as of 2025-11
      useSystem = false;
      settings = {
        autoUpdate = false;
        autoUpdateNotification = false;
        notifyAboutUpdates = false;
        enableReactDevtools = true;
        plugins = {
          MessageLogger = {
            enabled = true;
            ignoreSelf = true;
          };
          BadgeAPI.enable = true;
          CommandsAPI.enable = true;
          ContextMenuAPI.enable = true;
          MessageAccessoriesAPI.enable = true;
          MessageEventsAPI.enable = true;
          NoticesAPI.enable = true;
          NoTrack = {
            enabled = true;
            disableAnalytics = true;
          };
          Settings = {
            enabled = true;
            settingsLocation = "aboveActivity";
          };
          SupportHelper.enable = true;
          AlwaysTrust = {
            enabled = true;
            domain = true;
            file = true;
          };
          AnonymiseFileNames.enable = true;
          ClearURLs.enable = true;
          CrashHandler.enable = true;
          Experiments.enabled = false;
          FakeNitro.enable = true;
          LoadingQuotes.enabled = false;
          NoTypingAnimation.enable = true;
          WebContextMenus = {
            enabled = true;
            addBack = true;
          };
          WhoReacted.enable = true;
          ImplicitRelationships = {
            enabled = true;
            sortByAffinity = true;
          };
          WebScreenShareFixes.enable = true;
        };
      };
    };
  };
  catppuccin.vesktop.enable = true;
}
