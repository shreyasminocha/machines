{ pkgs, ... }:
{
  imports = [
    ./thunderbird.nix
    ./vesktop.nix
  ];

  home.packages = with pkgs; [
    slack
    zoom-us
    discord
    signal-desktop
  ];

  services.kdeconnect.enable = true;
}
