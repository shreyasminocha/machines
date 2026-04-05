{
  pkgs,
  pkgs-unstable,
  mypkgs,
  gui,
  ...
}:
{
  imports = [
    ./typora.nix
  ];

  home.packages =
    with pkgs;
    [
      sops

      zip
      unzip
      p7zip
      ouch
      file

      backblaze-b2
      qrencode
      bleachbit

      pandoc
      pkgs-unstable.harper
      mypkgs.harper-cli
      pkgs-unstable.rendercv # TODO: switch to stable once it has 2.7
    ]
    ++ lib.optionals gui (
      with kdePackages;
      [
        dolphin
        kio
        kio-fuse
        kio-extras
        audiocd-kio

        okular
        ark
        filelight
        rssguard

        libreoffice-qt
        calibre
        poppler

        keepassxc

        kiwix
        kubo

        monero-gui
      ]
    );

  programs.sioyek = {
    enable = gui;
    config = {
      touchpad_sensitivity = "0.5";
      should_launch_new_window = "1";
    };
  };

  programs.foliate.enable = gui;

  programs.nh = {
    enable = true;
  };

  programs.nix-index.enable = true;

  services.kdeconnect.enable = gui;
}
