{ pkgs, ... }:
{
  imports = [
    ./editors

    ./git.nix
    ./gpg.nix

    ./python.nix
    ./js.nix
    ./rust.nix
    ./markdown.nix
    ./nix.nix
    ./latex.nix
    ./typst.nix
    ./rev.nix
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
  ];

  programs.gh.enable = true;

  programs.lazygit = {
    enable = true;
  };
  catppuccin.lazygit.enable = true;
}
