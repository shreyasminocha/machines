{
  pkgs,
  lib,
  gui,
  ...
}:
{
  home.packages = lib.optionals gui [ pkgs.typora ];
}
