{
  pkgs,
  lib,
  mypkgs,
  gui,
  ...
}:
{
  imports = [
    ./beets.nix
  ];

  home.packages =
    with pkgs;
    [
      flac
      exiftool

      spotdl
      whipper

      mypkgs.tidal-dl-ng
    ]
    ++ lib.optionals gui [
      feishin
      kdePackages.elisa
      picard
      exactaudiocopy
    ];

  programs.cava.enable = true;
  catppuccin.cava.enable = true;
}
