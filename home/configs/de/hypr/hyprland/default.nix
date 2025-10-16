let
  xkb-layout-path = ".config/xkb/symbols/custom";
in
{
  inputs,
  system,
  ...
}:
{
  imports = [
    ./exec-once.nix
  ];

  wayland.windowManager.hyprland =
    let
      hyprland = inputs.hyprland.packages.${system};
      hy3 = inputs.hy3.packages.${system};
    in
    {
      enable = true;
      package = hyprland.hyprland;
      portalPackage = hyprland.xdg-desktop-portal-hyprland;
      systemd.enable = false; # conflicts with uwsm
      xwayland.enable = true;
      plugins = [
        hy3.default
      ];
      settings = {
        "$mod" = "SUPER";
        general = {
          layout = "hy3";
          gaps_in = 2;
          gaps_out = 5;
          resize_on_border = true;
        };
        debug.suppress_errors = true;
        monitor = import ./monitors.nix;
        animations.enabled = false;
        decoration = {
          blur.enabled = false;
          shadow.enabled = false;
        };
        bind = import ./bind.nix;
        bindl = [
          ", switch:Lid Switch, exec, hyprlock"
        ];
        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];
        gestures = {
          workspace_swipe = true;
          workspace_swipe_fingers = 3;
        };
        input = {
          touchpad = {
            natural_scroll = true;
          };
          kb_layout = "custom";
          kb_file = "~/${xkb-layout-path}";
          kb_options = "lv3:ralt_switch,caps:escape_shifted_capslock,rupeesign:4";
        };
        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
          vfr = true;
        };
        ecosystem = {
          no_update_news = true;
          no_donation_nag = true;
        };
        plugin.hy3 =
          let
            base = "rgba(1e1e2eff)";
            surface_1 = "rgba(45475aff)";
            mauve = "rgba(cba6f7bb)";
            red = "rgba(f38ba8ff)";
            text = "rgba(cdd6f4ff)";
            white = "rgba(ffffffff)";
          in
          {
            tabs = {
              radius = 0;

              "col.active" = mauve;
              "col.active.border" = mauve;
              "col.active.text" = base;

              "col.inactive" = base;
              "col.inactive.border" = base;
              "col.inactive.text" = text;

              "col.focused" = surface_1;
              "col.focused.border" = surface_1;
              "col.focused.text" = white;

              "col.urgent" = red;
              "col.urgent.border" = red;
              "col.urgent.text" = base;
            };
          };
        windowrulev2 = import ./window-rules.nix;
      };
    };
  catppuccin.hyprland.enable = true;
}
