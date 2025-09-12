{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    font = {
      name = "Fira Code";
      size = 11.0;
    };
    # themeFile = "Catppuccin-Macchiato";
    settings = {
      # background = "#263238";
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      scrollback_lines = 10000;
      enable_audio_bell = false;
    };
    keybindings = {
      "kitty_mod+n" = "new_tab";

      "ctrl+equal" = "change_font_size all +2.0";
      "ctrl+minus" = "change_font_size all -2.0";
      "ctrl+backspace" = "change_font_size all 0";

      "ctrl+h" = "neighboring_window left";
      "ctrl+l" = "neighboring_window right";
      "ctrl+j" = "neighboring_window down";
      "ctrl+k" = "neighboring_window up";

      "ctrl+down" = "neighboring_window down";
      "ctrl+up" = "neighboring_window up";
    };
  };
  catppuccin.kitty.enable = true;
}
