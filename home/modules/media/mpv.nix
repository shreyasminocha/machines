{
  pkgs,
  gui,
  ...
}:
{
  programs.mpv = {
    enable = gui;
    config = {
      screenshot-format = "png";
      screenshot-directory = "~/documents/screenshots";
      screenshot-template = "screenshot-%tF-%tI%tM%tS";
      save-position-on-quit = true;
      sub-font-size = 27;
      hwdec = "auto";
    };
    bindings = {
      j = "seek -10";
      k = "cycle pause";
      l = "seek 10";

      MBTN_LEFT = "ignore";
      MBTN_RIGHT = "ignore";

      "(" = "ignore";
      ")" = "ignore";

      "[" = "add speed -0.25";
      "]" = "add speed 0.25";

      "{" = "add speed -0.10";
      "}" = "add speed 0.10";

      "0" = "seek 00 absolute-percent";

      WHEEL_UP = "add volume -2";
      WHEEL_DOWN = "add volume 2";
      WHEEL_LEFT = "ignore";
      WHEEL_RIGHT = "ignore";

      "ALT+k" = "add sub-scale +0.1";
      "ALT+j" = "add sub-scale -0.1";
    };
    scripts = [
      pkgs.mpvScripts.mpris
    ];
  };
}
