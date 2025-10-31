{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  imports = [
    ./editors

    ./git.nix
    ./gpg.nix

    ./c.nix
    ./python.nix
    ./js.nix
    ./rust.nix
    ./markdown.nix
    ./nix.nix
    ./latex.nix
    ./typst.nix

    ./security.nix
  ];

  home.packages = with pkgs; [
    sqlite
    swift
    sshfs
    apptainer
    comma
    hyperfine
    tealdeer
    tokei
    act
    pkgs-unstable.vulnix
    jujutsu
  ];
}
