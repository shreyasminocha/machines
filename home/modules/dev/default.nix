{ pkgs, ... }:
{
  imports = [
    ./editors

    ./git.nix
    ./gpg.nix

    ./python.nix
    ./js.nix
    ./rust.nix
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
  ];

  programs.gh.enable = true;

  programs.gitui = {
    enable = true;
    keyConfig = ''
      move_left: Some(( code: Char('h'), modifiers: "")),
      move_right: Some(( code: Char('l'), modifiers: "")),
      move_up: Some(( code: Char('k'), modifiers: "")),
      move_down: Some(( code: Char('j'), modifiers: "")),

      stash_open: Some(( code: Char('l'), modifiers: "")),
    '';
  };
  catppuccin.gitui.enable = true;
}
