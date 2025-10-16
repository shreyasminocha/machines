{ pkgs, ... }:
{
  imports = [
    ./numbat.nix
    ./zotero.nix
  ];

  home.packages = with pkgs; [
    sage
  ];
}
