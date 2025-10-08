{
  imports = [
    ../modules/de
    ../modules/dev
    ../modules/media
    ../modules/sci
    ../modules/social
    ../modules/term
    ../modules/browsers

    # ../modules/activitywatch.nix
    ../modules/misc.nix
    ../modules/plasma.nix

    ./backups.nix
  ];

  home.username = "shreyas";
  home.homeDirectory = "/home/shreyas";

  home.file = { };

  home.sessionVariables = {
    BROWSER = "librewolf";
    TERM = "kitty";
    # GTK_USE_PORTAL = 1;
  };

  home.shell.enableFishIntegration = true;

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
