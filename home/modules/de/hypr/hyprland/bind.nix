[
  ", XF86AudioRaiseVolume, exec, pamixer -i 5"
  ", XF86AudioLowerVolume, exec, pamixer -d 5"
  ", XF86AudioMicMute, exec, pamixer --default-source -m"
  ", XF86AudioMute, exec, pamixer -t"

  ", XF86AudioPlay, exec, playerctl play-pause"
  ", XF86AudioPause, exec, playerctl play-pause"
  ", XF86AudioNext, exec, playerctl next"
  ", XF86AudioPrev, exec, playerctl previous"

  ", XF86MonBrightnessUp, exec, brightnessctl s +5%"
  ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"

  "shift, Print, exec, grimblast copy area"
  "ctrl shift, Print, exec, grimblast save area ~/documents/screenshots/screenshot-$(date +'%F-%H%M%S-%3N').png"
  ", Print, exec, grimblast save screen ~/documents/screenshots/screenshot-$(date +'%F-%H%M%S-%3N').png"

  "$mod shift, q, killactive"
  "$mod shift, x, exit"
  "$mod, f, fullscreen"
  "$mod, v, togglefloating"
  "$mod, e, hy3:makegroup, tab, ephemeral"
  "$mod, s, togglespecialworkspace, magic"
  "$mod shift, s, movetoworkspacesilent, special:magic"

  "$mod, return, exec, kitty"
  "$mod, b, exec, librewolf"
  "$mod, d, exec, dolphin"
  "$mod, c, exec, codium"
  "$mod, t, exec, typora"
  "$mod, space, exec, anyrun"
  "$mod, semicolon, exec, hyprlock"

  "$mod, h, hy3:movefocus, l"
  "$mod, l, hy3:movefocus, r"
  "$mod, k, hy3:movefocus, u"
  "$mod, j, hy3:movefocus, d"

  "$mod shift, h, hy3:movewindow, l"
  "$mod shift, l, hy3:movewindow, r"
  "$mod shift, k, hy3:movewindow, u"
  "$mod shift, j, hy3:movewindow, d"

  "$mod shift, left, hy3:movewindow, l"
  "$mod shift, right, hy3:movewindow, r"
  "$mod shift, up, hy3:movewindow, u"
  "$mod shift, down, hy3:movewindow, d"

  "$mod, left, workspace, -1"
  "$mod, right, workspace, +1"

  "$mod shift, left, movetoworkspace, -1"
  "$mod shift, right, movetoworkspace, +1"

  "ctrl $mod shift, left, movetoworkspacesilent, -1"
  "ctrl $mod shift, right, movetoworkspacesilent, +1"

  "alt $mod, left, workspace, e-1"
  "alt $mod, right, workspace, e+1"

  "ctrl $mod, h, focusmonitor, +1"
  "ctrl $mod, l, focusmonitor, -1"
  "ctrl $mod, left, focusmonitor, +1"
  "ctrl $mod, right, focusmonitor, -1"

  "alt $mod shift, left, movetoworkspace, e-1"
  "alt $mod shift, right, movetoworkspace, e+1"

  "alt $mod shift, left, movetoworkspacesilent, e-1"
  "alt $mod shift, right, movetoworkspacesilent, e+1"
]
++ (builtins.concatLists (
  builtins.genList (
    i:
    let
      j = i + 1;
    in
    [
      "$mod, ${toString j}, workspace, ${toString j}"
      "$mod shift, ${toString j}, movetoworkspace, ${toString j}"
      "ctrl $mod shift, ${toString j}, movetoworkspacesilent, ${toString j}"

      "alt $mod, ${toString j}, workspace, ${toString (10 + j)}"
      "alt $mod shift, ${toString j}, movetoworkspace, ${toString (10 + j)}"
      "ctrl alt $mod shift, ${toString j}, movetoworkspacesilent, ${toString (10 + j)}"
    ]
  ) 9
))
++ [
  "$mod, 0, workspace, 10"
  "$mod shift, 0, movetoworkspace, 10"
  "ctrl $mod shift, 0, movetoworkspacesilent, 10"

  "alt $mod, 0, workspace, 20"
  "alt $mod shift, 0, movetoworkspace, 20"
  "ctrl alt $mod shift, 0, movetoworkspacesilent, 20"
]
