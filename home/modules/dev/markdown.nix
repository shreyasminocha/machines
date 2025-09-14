{ pkgs, ... }:
{
  home.packages = with pkgs; [
    marksman
    glow
  ];
}
