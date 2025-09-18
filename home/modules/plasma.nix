{
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style = {
      # package = pkgs.adwaita-qt;
      name = "kvantum";
    };

    kde.settings = {
      dolphinrc = {
        General.ConfirmClosingMultipleTabs = false;
        General.HomeUrl = "/home/shreyas/desktop";
        General.RememberOpenedTabs = false;
        General.GlobalViewProps = false;
        General.ShowStatusBar = "FullWidth";
        ContentDisplay.UseShortRelativeDates = false;
      };

      kdeglobals = {
        General.TerminalApplication = "kitty";
        Sounds.Enable = false;
        General = {
          # fixed = "Source Code Pro,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
          # font = "Noto Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
          # menuFont = "Noto Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
          # smallestReadableFont = "Noto Sans,8,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
          # toolBarFont = "Noto Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
        };
      };

      kiorc = {
        Confirmations.ConfirmDelete = true;
        Confirmations.ConfirmEmptyTrash = true;
        Confirmations.ConfirmTrash = false;
        "Executable scripts".behaviourOnLaunch = "execute";
      };

      ktrashrc."\\/home\\/shreyas\\/.local\\/share\\/Trash" = {
        Days = 7;
        LimitReachedAction = 0;
        Percent = 10;
        UseSizeLimit = true;
        UseTimeLimit = false;
      };

      kwalletrc.Wallet."First Use" = false;
    };
  };

  programs.plasma = {
    enable = true; # TODO: this doesn't pull the DE, does it?
    shortcuts = { };
    configFile = { };
    dataFile = { };
  };
}
