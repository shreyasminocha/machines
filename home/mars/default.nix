{
  imports = [
    ../modules/de
    ../modules/dev
    ../modules/media
    ../modules/sci
    ../modules/social
    ../modules/term
    # ../modules/activitywatch.nix
    ../modules/browsers.nix
    ../modules/misc.nix
    ../modules/plasma.nix
  ];

  home.username = "shreyas";
  home.homeDirectory = "/home/shreyas";

  home.file = { };

  home.shell.enableFishIntegration = true;

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
