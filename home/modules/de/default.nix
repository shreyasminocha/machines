{ pkgs, ... }:
{
  imports = [
    ./hypr
    ./fonts.nix
    ./i18n.nix
    ./xdg.nix
    ./waybar.nix
    ./anyrun.nix
    ./gtk.nix
    ./kvantum.nix
  ];

  home.packages = with pkgs; [
    grimblast
    wl-clipboard
  ];

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.catppuccin-cursors.macchiatoDark;
    name = "catppuccin-macchiato-dark-cursors";
    size = 16;
  };

  services.blueman-applet.enable = true;
  services.network-manager-applet.enable = true;

  services.mako = {
    enable = true;
    settings = {
      font = "Noto Sans 10";
    };
  };
  catppuccin.mako.enable = true;
}
