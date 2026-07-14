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

  users.users.jellyfin.isSystemUser = true;
  users.users.jellyfin.isNormalUser = false;
  users.users.jellyfin.extraGroups = [
    "render"
    "video"
  ];

  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
}
