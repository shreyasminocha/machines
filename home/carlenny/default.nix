{ ... }:
{
  imports = [
    ./misc.nix

    ../configs/term
    ../configs/dev
    ../configs/misc.nix
  ];

  home.username = "sminocha7";
  home.homeDirectory = "/home/sminocha7";

  home.shell.enableFishIntegration = true;

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "24.05";
}
