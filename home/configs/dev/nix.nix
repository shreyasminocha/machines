{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixfmt-tree
    nixfmt
    nil
    nix-melt
    statix
  ];
}
