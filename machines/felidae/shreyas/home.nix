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

  home-manager.users.shreyas = ../../../home/felidae;

  home-manager.extraSpecialArgs = {
    inherit
      inputs
      pkgs-unstable
      mypkgs
      secrets
      ;
    gui = false;
  };
}
