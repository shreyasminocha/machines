{ pkgs, ... }:
{
  imports = [ ./librewolf.nix ];

  home.packages = with pkgs; [
    tor-browser
    ladybird
    lynx
  ];

  programs.firefox = {
    enable = true;
  };

  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
  };
}
