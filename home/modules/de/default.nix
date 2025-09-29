{ pkgs, ... }:
{
  imports = [
    ./hypr

    ./niri.nix
    ./swaylock.nix

    ./fonts.nix
    ./i18n.nix
    ./xdg.nix
    ./xkb.nix
    ./waybar.nix
    ./anyrun.nix
    ./mako.nix
    ./gtk.nix
    ./kvantum.nix
  ];

  home.packages = with pkgs; [
    grimblast
    wl-clipboard
    networkmanagerapplet
    tailscale-systray
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
