{ config, pkgs, ... }:
{
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    settings = {
      xwayland-satellite.enable = true;
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
        preset-window-heights = [
          { proportion = 1.0; }
          { proportion = 1.0 / 2.0; }
        ];
        preset-column-widths = [
          { proportion = 1.0; }
          { proportion = 1.0 / 2.0; }
        ];
      };
      prefer-no-csd = true;
      input = {
        # focus-follows-mouse.enable = true;
        keyboard.xkb = {
          file = "/home/shreyas/.config/xkb/symbols/custom";
          layout = "custom";
          # variant = "qwerty";
          options = "lv3:ralt_switch,caps:escape_shifted_capslock,rupeesign:4";
        };
      };
      environment = { };
      switch-events.lid-close.action.spawn = "swaylock";
      screenshot-path = "~/documents/screenshots/screenshot-%Y-%m-%d-%H%M%S-%f.png";
      binds = import ./binds.nix { inherit config; };
      spawn-at-startup = [
        { argv = [ "swaybg -i /home/shreyas/secret-flake/wallpaper.jpg" ]; }
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
      ];
    };
  };
}
