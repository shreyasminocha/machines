{
  pkgs,
  lib,
  gui,
  ...
}:
{
  imports = [
    ./numbat.nix
  ]
  ++ lib.optionals gui [
    ./zotero.nix
  ];

  home.packages = with pkgs; [
    bc
    sage
  ];
}
