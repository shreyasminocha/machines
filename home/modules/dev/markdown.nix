{ pkgs, ... }:
{
  home.packages = with pkgs; [
    marksman
    glow
  ];

  home.file.".config/glow/glow.yml" = {
    enable = true;
    source = (pkgs.formats.yaml { }).generate "glow.yml" {
      style = "auto";
      mouse = true;
      pager = false;
      width = 100;
      all = false;
    };
  };
}
