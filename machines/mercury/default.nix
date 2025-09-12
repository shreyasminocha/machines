{ pkgs, ... }:
{
  environment.packages = with pkgs; [
    procps
    killall
    diffutils
    findutils
    utillinux
    tzdata
    hostname
    man
    gnugrep
    gnused
    gnutar
    bzip2
    gzip
    xz
    zip
    unzip

    openssh
  ];

  environment.etcBackupExtension = ".bak";

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    optimise.automatic = true;
  };

  time.timeZone = "US/Eastern";

  home-manager = {
    backupFileExtension = "bak";
    useGlobalPkgs = true;

    config =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        imports = [
          ../../home/mercury
        ];

        home.stateVersion = "24.05";
      };
  };

  system.stateVersion = "24.05";
}
