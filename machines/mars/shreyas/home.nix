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
    outputs.homeManagerModules.default
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
