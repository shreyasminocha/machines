{
  inputs,
  outputs,
  system,
  pkgs-unstable,
  secrets,
  mypkgs,
  ...
}:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "bak";

  home-manager.users.shreyas = ../../../home/mars;

  home-manager.sharedModules = [
    inputs.hyprland.homeManagerModules.default

    inputs.niri.homeModules.niri
    # inputs.niri.homeModules.config

    inputs.nixvim.homeModules.nixvim
    inputs.catppuccin.homeModules.catppuccin
    inputs.plasma-manager.homeManagerModules.plasma-manager

    outputs.homeManagerModules.default

    secrets.homeManagerModules.mars
    secrets.homeManagerModules.email-accounts
    secrets.homeManagerModules.music
  ];

  home-manager.extraSpecialArgs =
    let
      inherit (inputs) nixvim catppuccin;
    in
    {
      inherit
        system
        inputs
        pkgs-unstable
        mypkgs
        secrets
        nixvim
        catppuccin
        ;
      gui = true; # TODO try to move this into `./home/mars/default.nix`
    };
}
