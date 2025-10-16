{
  pkgs,
  lib,
  gui,
  ...
}:
{
  home.packages = lib.optionals gui [ pkgs.typora ];

  home.file.".config/typora-flags.conf".text = ''
    --ozone-platform-hint=auto
    --enable-wayland-ime
  '';
}
