{ config, ... }:
let
  local-port = 4533;
  navidrome-secrets = "services/navidrome/env";
in
{
  services.caddy.virtualHosts."music.minocha.family" = {
    extraConfig = ''
      reverse_proxy :${toString local-port}
    '';
  };

  services.navidrome = {
    enable = true;
    settings = {
      Port = local-port;
      MusicFolder = "/var/music";
      DataFolder = "/var/navidrome";
      EnableInsightsCollector = false;
      ListenBrainz.BaseURL = "http://127.0.0.1:42010/apis/listenbrainz/1/"; # maloja

      # "ND_BACKUP_SCHEDULE" = "weekly";
      # "ND_BACKUP_PATH" = "/var/backup/navidrome";
      # "ND_BACKUP_COUNT" = "5";
    };
    environmentFile = config.sops.secrets.${navidrome-secrets}.path;
  };

  sops.secrets.${navidrome-secrets} = { };
}
