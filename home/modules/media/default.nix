{
  pkgs,
  gui,
  ...
}:
{
  imports = [
    ./music
    ./mpv.nix
  ];

  home.packages =
    with pkgs;
    [
      pamixer
      brightnessctl
      playerctl
      ffmpeg
      internetarchive
    ]
    ++ lib.optionals gui [
      kdePackages.kolourpaint
      inkscape
      gimp3

      pavucontrol
      pwvucontrol
    ];

  programs.yt-dlp.enable = true;

  programs.imv.enable = true;
}
