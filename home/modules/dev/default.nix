{ pkgs, pkgs-unstable, ... }:
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
    act
    pkgs-unstable.vulnix
  ];

  programs.gh.enable = true;

  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        timeFormat = "2025-12-31";
        shortTimeFormat = "2359";
        nerdFontsVersion = "3";
        border = "single";
      };
      git = {
        paging.useExternalDiffGitConfig = true;
        parseEmoji = true;
      };
      update.method = "never";
      disableStartupPopups = true;
    };
  };
  catppuccin.lazygit.enable = true;
}
