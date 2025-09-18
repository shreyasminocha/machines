{
  inputs,
  pkgs-unstable,
  mypkgs,
  secrets,
  ...
}:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.sharedModules = [
    inputs.catppuccin.homeModules.catppuccin

    secrets.homeManagerModules.music
  ];

  home-manager.users.shreyas = import ../../../home/roux;

  home-manager.extraSpecialArgs = {
    inherit inputs pkgs-unstable mypkgs;
    gui = false;
  };
}
