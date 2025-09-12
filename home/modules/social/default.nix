{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  imports = [
    ./thunderbird.nix
  ];

  home.packages = with pkgs; [
    slack
    zoom-us
    discord
    pkgs-unstable.signal-desktop
  ];

  services.kdeconnect.enable = true;
}
