{
  programs.bat = {
    enable = true;
    config = {
      plain = true;
      italic-text = "always";
      map-syntax = [
        "mjs:js"
        "svelte:html"
      ];
    };
  };
  catppuccin.bat.enable = true;
}
