{ config, pkgs, ... }:
{
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    settings = {
      outputs = {
        "eDP-1".scale = 1.5;
        "DVI-I-1".scale = 1.0;
      };
      hotkey-overlay.skip-at-startup = true;
      layout = {
        gaps = 1;
        # default-column-width.proportion = 1.0;
        focus-ring.width = 1;
        tab-indicator.position = "top";
        empty-workspace-above-first = true;
      };
      prefer-no-csd = true;
      input = {
        # focus-follows-mouse.enable = true;
        keyboard.xkb = {
          #   file = ".config/xkb/symbols/custom";
          layout = "us";
          variant = "qwerty";
          options = "lv3:ralt_switch,caps:escape_shifted_capslock,rupeesign:4";
        };
      };
      environment = { };
      switch-events.lid-close.action.spawn = "swaylock";
      screenshot-path = "~/documents/screenshots/screenshot-%Y-%m-%d-%H%M%S-%f.png";
      binds = with config.lib.niri.actions; {
        "XF86AudioRaiseVolume".action.spawn = [
          "pamixer"
          "-i"
          "5"
        ];
        "XF86AudioLowerVolume".action.spawn = [
          "pamixer"
          "-d"
          "5"
        ];
        "XF86AudioMicMute".action.spawn = [
          "pamixer"
          "--default-source"
          "-m"
        ];
        "XF86AudioMute".action.spawn = [
          "pamixer"
          "-t"
        ];

        "XF86AudioPlay".action.spawn = [
          "playerctl"
          "play-pause"
        ];
        "XF86AudioPause".action.spawn = [
          "playerctl"
          "play-pause"
        ];
        "XF86AudioNext".action.spawn = [
          "playerctl"
          "next"
        ];
        "XF86AudioPrev".action.spawn = [
          "playerctl"
          "previous"
        ];

        "XF86MonBrightnessUp".action.spawn = [
          "brightnessctl"
          "s"
          "+5%"
        ];
        "XF86MonBrightnessDown".action.spawn = [
          "brightnessctl"
          "s"
          "5%-"
        ];

        "Print".action = screenshot-window;
        "shift+Print".action = screenshot;
        "ctrl+shift+Print".action = screenshot;

        "Mod+return".action.spawn = "kitty";
        "Mod+b".action.spawn = "librewolf";
        "Mod+d".action.spawn = "dolphin";
        "Mod+c".action.spawn = "codium";
        "Mod+t".action.spawn = "typora";
        "Mod+space".action.spawn = "anyrun";
        "Mod+semicolon".action.spawn = "swaylock";

        "Mod+e".action = toggle-column-tabbed-display;
        "Mod+v".action = toggle-window-floating;
        "Mod+shift+q".action = close-window;
        "Mod+f".action = fullscreen-window;

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
      };
      spawn-at-startup = [
        { argv = [ "waybar" ]; }
        {
          argv = [
            "nm-applet"
            "--indicator"
          ];
        }
        { argv = [ "blueman-applet" ]; }
        { argv = [ "tailscale-systray" ]; }
        { argv = [ "fcitx5" ]; }
        {
          argv = [
            "systemctl"
            "--user"
            "start"
            "hyprpolkitagent"
          ];
        }
      ];
    };
  };
}
