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
    ]
    ++ lib.optionals gui [
      kdePackages.dolphin
      kdePackages.kio
      kdePackages.kio-fuse
      kdePackages.kio-extras
      kdePackages.audiocd-kio

      kdePackages.okular
      kdePackages.ark
      kdePackages.filelight
      libreoffice-qt
      pandoc
    ];

  programs.sioyek = {
    enable = gui;
    config = {
      touchpad_sensitivity = "0.5";
      should_launch_new_window = "1";
    };
  };

  programs.nh = {
    enable = true;
  };

  programs.nix-index.enable = true;

  services.kdeconnect.enable = gui;
}
