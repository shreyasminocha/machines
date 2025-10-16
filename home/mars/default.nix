{
  imports = [
    ./backups.nix

    ../configs/de
    ../configs/dev
    ../configs/media
    ../configs/sci
    ../configs/social
    ../configs/term
    ../configs/browsers

    # ../configs/activitywatch.nix
    ../configs/misc.nix
    ../configs/plasma.nix
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
