{ pkgs, ... }:
{
  imports = [
    # ./hypr
    ./niri

    ./fonts.nix
    ./i18n.nix
    ./xdg.nix
    ./xkb.nix

    # ./gtk.nix
    ./kvantum.nix

    ./waybar.nix
    # ./anyrun.nix
    ./fuzzel.nix

    ./kwallet.nix
    ./mako.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
  ];

  services.blueman-applet.enable = true;
  services.network-manager-applet.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.catppuccin-cursors.macchiatoDark;
    name = "catppuccin-macchiato-dark-cursors";
    size = 16;
  };
}
