{ pkgs, ... }:
{
  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };
  gtk = with pkgs; {
    #theme.package = catppuccin-gtk;
    #iconTheme.package = kdePackages.breeze-icons;
    cursorTheme.package = catppuccin-cursors;
  };
  # catppuccin.gtk.enable = true; doesn't exist any more
}
