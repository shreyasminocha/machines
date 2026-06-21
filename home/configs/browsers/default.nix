{ pkgs, config, ... }:
{
  imports = [ ./librewolf.nix ];

  home.packages = with pkgs; [
    google-chrome
    tor-browser
    ladybird
    lynx
  ];

  programs.firefox = {
    enable = true;
    # the new default. manual override necessary because of old `home.stateVersion`
    configPath = "${config.xdg.configHome}/mozilla/firefox";
  };

  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
  };
}
