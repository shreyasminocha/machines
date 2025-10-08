{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  imports = [
    ./thunderbird.nix
    ./vesktop.nix
  ];

  home.packages = with pkgs; [
    slack
    zoom-us
    discord
    # TODO: swap this out for `pkgs.`; this was originally -unstable because
    # the arch package was newer than nixpkgs, and the state was incompatible
    pkgs-unstable.signal-desktop
  ];

  services.kdeconnect.enable = true;
}
