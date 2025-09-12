{
  inputs,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    xdg-utils
  ];

  # home.sessionVariables.GTK_USE_PORTAL = 1;

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
        # xdg-desktop-portal-gtk
        # xdg-desktop-portal-gnome
        inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland
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
          "x-scheme-handler/mailto" = [ "thunderbird.desktop" ];
        };
        defaultApplications = {
          "text/html" = librewolf;
          "image/png" = imv;
          "image/jpeg" = imv;
          "application/pdf" = okular;
          "video/mp4" = mpv;
          "audio/mpeg" = mpv;
          "audio/flac" = mpv;
          "application/x-tar" = ark;
          "application/gzip" = ark;
          "inode/directory" = dolphin;
          "text/markdown" = "typora.desktop";
        };
      };
  };
}
