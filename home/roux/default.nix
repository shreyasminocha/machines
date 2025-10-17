{ inputs, secrets, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.catppuccin.homeModules.catppuccin
    inputs.sops-nix.homeManagerModules.sops

    secrets.homeManagerModules.music

    ./misc.nix

    ../configs/term
    ../configs/dev/editors
    ../configs/dev/git.nix
    ../configs/dev/nix.nix
    ../configs/media/music
    ../configs/misc.nix
  ];

  home.username = "shreyas";
  home.homeDirectory = "/home/shreyas";

  home.shell.enableFishIntegration = true;

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
