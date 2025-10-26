{
  config,
  pkgs,
  lib,
  ...
}:
[
  {
    argv = [
      (lib.getExe pkgs.swaybg)
      "-i"
      "/home/shreyas/secret-flake/wallpaper.jpg"
    ];
  }
  { argv = [ (lib.getExe config.programs.waybar.package) ]; }
  { argv = [ (lib.getExe pkgs.wayland-pipewire-idle-inhibit) ]; }

  {
    argv = [
      (lib.getExe pkgs.networkmanagerapplet)
      "--indicator"
    ];
  }
  { argv = [ "blueman-applet" ]; }
  { argv = [ (lib.getExe pkgs.tailscale-systray) ]; }

  { argv = [ "fcitx5" ]; }
]
