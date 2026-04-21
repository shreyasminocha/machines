{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;
    settings = {
      add_newline = false;
      command_timeout = 1000; # milliseconds
    };
  };
}
