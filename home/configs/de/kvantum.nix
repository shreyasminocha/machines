{ config, ... }:
let
  flavor = config.catppuccin.flavor;
  accent = config.catppuccin.accent;
  themeName = "catppuccin-${flavor}-${accent}";
in
{
  xdg.configFile = {
    "Kvantum/${themeName}".source = "${config.catppuccin.sources.kvantum}/share/Kvantum/${themeName}";
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=${themeName}
    '';
  };
}
