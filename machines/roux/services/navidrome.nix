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

  virtualisation.oci-containers.containers."navidrome" = {
    image = "ghcr.io/navidrome/navidrome:0.56.1";
    autoStart = true;
    user = "1000:100";
    # ports = [ "${toString local-port}:4533" ];
    extraOptions = [ "--network=host" ];
    volumes = [
      "/var/navidrome:/data"
      "/var/music:/music:ro"
    ];
    environmentFiles = [ config.sops.secrets.${navidrome-secrets}.path ];
    environment = {
      "ND_ENABLEINSIGHTSCOLLECTOR" = "false";
      "ND_LISTENBRAINZ_BASEURL" = "http://127.0.0.1:42010/apis/listenbrainz/1/"; # maloja

      # "ND_BACKUP_SCHEDULE" = "weekly";
      # "ND_BACKUP_PATH" = "/var/backup/navidrome";
      # "ND_BACKUP_COUNT" = "5";

      "ND_SUBSONICARTISTPARTICIPATIONS" = "true";
    };
  };

  sops.secrets.${navidrome-secrets} = { };
}
