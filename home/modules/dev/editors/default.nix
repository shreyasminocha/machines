{
  lib,
  gui,
  ...
}:
{
  imports =
    [
      ./helix.nix
      ./neovim
    ]
    ++ lib.optionals gui [
      ./vscode
      ./zed.nix
    ];
}
