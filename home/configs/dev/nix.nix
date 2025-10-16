{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixfmt-tree
    nixfmt-rfc-style
    nil
    nix-melt
    statix
  ];
}
