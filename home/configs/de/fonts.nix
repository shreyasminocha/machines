{ pkgs, ... }:
{
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    noto-fonts-monochrome-emoji
    noto-fonts-emoji-blob-bin

    liberation_ttf
    roboto
    roboto-slab
    lato
    source-sans-pro
    source-serif-pro
    source-code-pro

    lohit-fonts.devanagari

    fira-code
    nerd-fonts.fira-code

    lmodern
  ];

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "Noto Mono" ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Serif" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
