_: {
  imports = [
    ../configs/term
    ../configs/dev/git.nix
  ];

  home.file = { };

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
