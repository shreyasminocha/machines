{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    xdg-utils
  ];

  xdg = {
    enable = true;

    portal = {
      enable = true;
      config = {
        common = {
          # default = [ "hyprland" "kde" "gtk" ];
          default = [
            "hyprland"
            "kde"
          ];
          "org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
        };
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        kdePackages.xdg-desktop-portal-kde
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
        # inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland
      ];
      xdgOpenUsePortal = true;
    };

    # TODO: source these from the relevant pkgs
    mimeApps =
      let
        librewolf = "librewolf.desktop";
        imv = "imv.desktop";
        mpv = "mpv.desktop";
        ark = "org.kde.ark.desktop";
        okular = "org.kde.okular.desktop";
        dolphin = "org.kde.dolphin.desktop";
      in
      {
        enable = true;
        associations.added = {
          "x-scheme-handler/http" = [ librewolf ];
          "x-scheme-handler/https" = [ librewolf ];
          "x-scheme-handler/mailto" = [ "thunderbird.desktop" ];
          "x-scheme-handler/about" = [ librewolf ];
          "x-scheme-handler/unknown" = [ librewolf ];
        };
        defaultApplications = {
          "text/html" = librewolf;
          "inode/directory" = dolphin;
          "inode/mount-point" = dolphin;

          "image/png" = imv;
          "image/gif" = imv;
          "image/jpeg" = imv;
          "image/webp" = imv;
          "image/bmp" = imv;
          "image/vnd.microsoft.icon" = imv;

          "video/mp4" = mpv;
          "video/mpeg" = mpv;
          "video/webm" = mpv;
          "video/ogg" = mpv;
          "video/x-matroska" = mpv;
          "video/quicktime" = mpv;

          "audio/mpeg" = mpv;
          "audio/flac" = mpv;
          "audio/ogg" = mpv;
          "audio/x-wav" = mpv;

          "application/pdf" = okular;
          "application/x-tar" = ark;
          "application/gzip" = ark;
          "text/markdown" = "typora.desktop";
        };
      };
    userDirs =
      let
        homeDir = config.home.homeDirectory;
      in
      {
        enable = true;

        desktop = "${homeDir}/desktop";
        documents = "${homeDir}/documents";
        download = "${homeDir}/documents/downloads";
        music = "${homeDir}/hoard/music";
        pictures = "${homeDir}/documents/misc-images";
        videos = "${homeDir}/hoard/vid";
      };
  };
}
