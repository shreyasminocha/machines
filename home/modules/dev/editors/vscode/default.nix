{
  pkgs,
  pkgs-unstable,
  ...
}:
let
  extensions = import ./extensions { inherit pkgs; };
  settings = import ./settings { inherit pkgs; };
in
{
  programs.vscode = {
    enable = true;
    package = pkgs-unstable.vscodium;
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
