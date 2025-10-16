{
  programs.zellij = {
    enable = true;
    # TODO: why did i comment this out?
    # enableFishIntegration = true;
    settings = {
      # theme = "catppuccin-macchiato";
      ui.pane_frames.hide_session_name = true;
      show_startup_tips = false;
      show_release_notes = false;
    };
  };
  catppuccin.zellij.enable = true;
}
