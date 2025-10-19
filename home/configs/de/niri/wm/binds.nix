{
  config,
  pkgs,
  lib,
  ...
}:
with config.lib.niri.actions;
let
  pamixer = lib.getExe pkgs.pamixer;
  brightnessctl = lib.getExe pkgs.brightnessctl;
  playerctl = lib.getExe pkgs.playerctl;
  librewolf = lib.getExe config.programs.librewolf.package;
  vscode = lib.getExe config.programs.vscode.package;
  kitty = lib.getExe config.programs.kitty.package;
  typora = lib.getExe pkgs.typora;
  fuzzel = lib.getExe config.programs.fuzzel.package;
  swaylock = lib.getExe config.programs.swaylock.package;
in
{
  "XF86AudioRaiseVolume".action.spawn = [
    pamixer
    "-i"
    "5"
  ];
  "XF86AudioLowerVolume".action.spawn = [
    pamixer
    "-d"
    "5"
  ];
  "XF86AudioMicMute".action.spawn = [
    pamixer
    "--default-source"
    "-m"
  ];
  "XF86AudioMute".action.spawn = [
    pamixer
    "-t"
  ];

  "XF86AudioPlay".action.spawn = [
    playerctl
    "play-pause"
  ];
  "XF86AudioPause".action.spawn = [
    playerctl
    "play-pause"
  ];
  "XF86AudioNext".action.spawn = [
    playerctl
    "next"
  ];
  "XF86AudioPrev".action.spawn = [
    playerctl
    "previous"
  ];

  "XF86MonBrightnessUp".action.spawn = [
    brightnessctl
    "s"
    "+5%"
  ];
  "XF86MonBrightnessDown".action.spawn = [
    brightnessctl
    "s"
    "5%-"
  ];

  "Print".action = screenshot-window;
  "shift+Print".action = screenshot;
  "ctrl+shift+Print".action = screenshot;

  "Mod+b".action.spawn = librewolf;
  "Mod+shift+b".action.spawn = [
    librewolf
    "-P"
    "incognito"
  ];
  "Mod+return".action.spawn = kitty;
  "Mod+d".action.spawn = "dolphin";
  "Mod+c".action.spawn = vscode;
  "Mod+t".action.spawn = typora;
  "Mod+space".action.spawn = fuzzel;
  "Mod+semicolon".action.spawn = swaylock;

  "Mod+e".action = toggle-column-tabbed-display;

  "Mod+i".action = switch-preset-window-height;
  "Mod+shift+i".action = switch-preset-window-height-back;
  "Mod+u".action = switch-preset-column-width;
  "Mod+shift+u".action = switch-preset-column-width-back;

  "Mod+v".action = toggle-window-floating;
  "Mod+shift+q".action = close-window;
  "Mod+f".action = fullscreen-window;
  "Mod+o".action = toggle-overview;

  "Mod+h".action = focus-column-left;
  "Mod+left".action = focus-column-left;
  "Mod+l".action = focus-column-right;
  "Mod+right".action = focus-column-right;

  "Mod+j".action = focus-window-or-workspace-down;
  "Mod+down".action = focus-window-or-workspace-down;
  "Mod+k".action = focus-window-or-workspace-up;
  "Mod+up".action = focus-window-or-workspace-up;

  "ctrl+Mod+h".action = focus-monitor-left;
  "ctrl+Mod+left".action = focus-monitor-left;
  "ctrl+Mod+l".action = focus-monitor-right;
  "ctrl+Mod+right".action = focus-monitor-right;

  "Mod+shift+h".action = move-column-left;
  "Mod+shift+left".action = move-column-left;
  "Mod+shift+l".action = move-column-right;
  "Mod+shift+right".action = move-column-right;

  "Mod+shift+j".action = move-window-down-or-to-workspace-down;
  "Mod+shift+down".action = move-window-down-or-to-workspace-down;
  "Mod+shift+k".action = move-window-up-or-to-workspace-up;
  "Mod+shift+up".action = move-window-up-or-to-workspace-up;

  "ctrl+Mod+shift+h".action = move-column-to-monitor-left;
  "ctrl+Mod+shift+left".action = move-column-to-monitor-left;
  "ctrl+Mod+shift+l".action = move-column-to-monitor-right;
  "ctrl+Mod+shift+right".action = move-column-to-monitor-right;

  "Mod+minus".action = set-column-width "-10%";
  "Mod+equal".action = set-column-width "+10%";

  "Mod+shift+return".action = maximize-column;
}
