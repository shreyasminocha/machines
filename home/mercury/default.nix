_: {
  imports = [
    ../modules/term
    ../modules/dev/git.nix
  ];

  home.file = { };

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
