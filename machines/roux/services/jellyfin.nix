{ pkgs, ... }:
{
  services.caddy.virtualHosts."media.minocha.family" = {
    extraConfig = ''
      reverse_proxy :8096
    '';
  };

  services.jellyfin = {
    enable = true;
  };

  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
}
