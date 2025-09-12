{
  lib,
  gui,
  ...
}:
{
  imports =
    [
      ./helix.nix
      ./neovim.nix
    ]
    ++ lib.optionals gui [
      ./vscode
      ./zed.nix
    ];
}
