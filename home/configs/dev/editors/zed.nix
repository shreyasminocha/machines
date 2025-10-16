{
  programs.zed-editor = {
    enable = true;
    userSettings = {
      features = {
        copilot = false;
        inline_completion_provider = "none";
      };
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      assistant = {
        button = false;
        enabled = false;
        version = "2";
      };
      chat_panel = {
        button = false;
      };
      collaboration_panel = {
        button = false;
      };
      ui_font_size = 14;
      buffer_font_size = 14;
      theme = {
        mode = "dark";
        light = "One Light";
        dark = "Material Dark";
      };
      tab_size = 2;
      # vim_mode = true;
      format_on_save = "off";
    };
    userKeymaps = [ ];
  };
}
