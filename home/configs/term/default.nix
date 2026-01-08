{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./fish.nix
    ./starship.nix
    ./zellij.nix
    ./atuin.nix
    ./bat.nix
    ./yazi.nix
    ./fastfetch.nix
    ./kitty.nix
  ];

  home.packages = with pkgs; [
    curl
    wget
    xh

    tre-command
    dust
    doggo
    hexyl

    lsof
    powertop

    parallel
    inetutils
    just

    restic

    intermodal
    mktorrent

    trash-cli
    imagemagick
    nmap
    speedtest-cli
  ];

  programs.zoxide = {
    enableFishIntegration = true;
    enable = true;
  };

  programs.eza = lib.mkMerge [
    {
      enable = true;
      icons = "auto";
      extraOptions = [
        "--binary" # size units
      ];
    }

    (lib.mkIf ((builtins.getEnv "hostname") != "localhost") {
      enableFishIntegration = true;
    })
  ];

  programs.broot = {
    enable = true;
  };

  programs.nushell.enable = true;

  programs.ripgrep.enable = true;
  programs.fd.enable = true;

  programs.htop.enable = true;
  programs.btop = {
    enable = true;
  };
  catppuccin.btop.enable = true;
}
