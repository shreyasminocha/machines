{ pkgs, ... }:
{
  home.packages = with pkgs; [
    networkmanagerapplet
    tailscale-systray
  ];

  wayland.windowManager.hyprland.settings.exec-once = [
    "waybar"
    "nm-applet --indicator"
    "blueman-applet"
    "tailscale-systray"
    "fcitx5"
    "systemctl --user start hyprpolkitagent"
  ];
}
