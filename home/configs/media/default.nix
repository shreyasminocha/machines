{
  pkgs,
  pkgs-unstable,
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
      ffmpeg
      internetarchive
    ]
    ++ lib.optionals gui [
      kdePackages.kolourpaint
      inkscape
      gimp3

      pkgs-unstable.audacity

      pavucontrol
      pwvucontrol
    ];

  programs.yt-dlp.enable = true;

  programs.imv.enable = true;
}
