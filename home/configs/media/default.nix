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
      dvdbackup
      internetarchive
    ]
    ++ lib.optionals gui [
      vlc

      kdePackages.kolourpaint
      inkscape
      gimp3

      pkgs-unstable.audacity
      kdePackages.kdenlive
      handbrake

      pavucontrol
      pwvucontrol
    ];

  programs.yt-dlp.enable = true;

  programs.imv.enable = true;

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
    ];
  };
}
