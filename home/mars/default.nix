{
  inputs,
  secrets,
  ...
}:
{
  imports = [
    # inputs.hyprland.homeManagerModules.default

    inputs.niri.homeModules.niri
    # inputs.niri.homeModules.config

    inputs.nixvim.homeModules.nixvim
    inputs.catppuccin.homeModules.catppuccin
    inputs.plasma-manager.homeManagerModules.plasma-manager

    secrets.homeManagerModules.mars
    secrets.homeManagerModules.email-accounts
    secrets.homeManagerModules.music

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

  home.sessionVariables = {
    BROWSER = "librewolf";
    TERMINAL = "kitty";
    # GTK_USE_PORTAL = 1;
  };

  home.shell.enableFishIntegration = true;

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
