let
  xkb-layout-path = ".config/xkb/symbols/custom";
in
{
  home.file."${xkb-layout-path}" = {
    source = ./xkb-layout.txt;
  };
}
