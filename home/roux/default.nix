{
  imports = [
    ./misc.nix

    ../modules/term
    ../modules/dev/editors
    ../modules/dev/git.nix
    ../modules/dev/nix.nix
    ../modules/media/music
    ../modules/misc.nix
  ];

  home.username = "shreyas";
  home.homeDirectory = "/home/shreyas";

  home.file = { };

  home.shell.enableFishIntegration = true;

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
