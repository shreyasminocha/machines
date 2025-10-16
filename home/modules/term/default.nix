{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./fish.nix
    ./kitty.nix
    ./zellij.nix
    ./bat.nix
    ./atuin.nix
    ./fastfetch.nix
    ./yazi.nix
  ];

  home.packages = with pkgs; [
    tre-command
    lsof
    powertop
    curl
    wget
    restic
    intermodal
    mktorrent
    trash-cli
    imagemagick
    speedtest-cli
    xh
    just
    parallel
    inetutils
    nmap
    doggo
    dust
    hexyl
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

  programs.nushell.enable = true;

  programs.ripgrep.enable = true;
  programs.fd.enable = true;
  programs.htop.enable = true;

  programs.btop = {
    enable = true;
  };
  catppuccin.btop.enable = true;

  programs.broot = {
    enable = true;
  };
}
