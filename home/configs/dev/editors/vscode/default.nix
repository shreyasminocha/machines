{
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
let
  vscode = pkgs-unstable.vscodium;
  extensions = import ./extensions { inherit pkgs lib vscode; };
  settings = import ./settings { inherit pkgs lib; };
in
{
  programs.vscodium = {
    enable = true;
    package = vscode;
    mutableExtensionsDir = false;
    profiles.default = {
      inherit (extensions) extensions;
      userSettings = settings // extensions.settings;
      keybindings = import ./keybindings.nix;
    };
  };

  catppuccin.vscodium.profiles.default.enable = true;
}
