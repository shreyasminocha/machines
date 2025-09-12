{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixfmt-tree
    nil
    nix-melt
    statix
  ];
}
