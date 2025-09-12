{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ../modules/term.nix
    ../modules/git.nix
  ];

  home.file = { };

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
