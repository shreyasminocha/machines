{ pkgs, lib, ... }:
let
  vscode = pkgs.vscodium;
  extensions = import ./extensions { inherit pkgs lib vscode; };
  settings = import ./settings { inherit pkgs lib; };
in
{
  programs.vscode = {
    enable = true;
    package = vscode;
    mutableExtensionsDir = false;
    profiles.default = {
      inherit (extensions) extensions;
      userSettings = settings // extensions.settings;
      keybindings = import ./keybindings.nix;
    };
  };

  home.file.".config/codium-flags.conf".text = ''
    --ozone-platform-hint=auto
    --enable-wayland-ime
  '';
}
