{ pkgs, pkgs-unstable, ... }:
let
  # TODO: switch—currently -unstable because the jupyter ext had issues with the stable
  vscode = pkgs-unstable.vscodium;
  extensions = import ./extensions { inherit pkgs vscode; };
  settings = import ./settings { inherit pkgs; };
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
