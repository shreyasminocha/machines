{
  pkgs,
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

      unzip
      file

      backblaze-b2
      qrencode
      bleachbit
      ouch
      pandoc
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

        libreoffice-qt
        calibre
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
