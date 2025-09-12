{
  programs.hyprlock = {
    enable = true;
    settings = {
      auth."fingerprint:enabled" = true;
      background.color = "rgba(30, 30, 30, 1.0)";
      input-field = {
        size = "400, 50";
        rounding = 0;
        outline_thickness = 0;
      };
      animations.enable = false;
    };
  };
}
