{ config, ... }:
let
  domain = "anki.shr.cx";
  local-port = 8050;
  anki-secret = "services/anki/env";
in
{
  services.caddy.virtualHosts.${domain} = {
    extraConfig = ''
      reverse_proxy :${toString local-port}
    '';
  };

  virtualisation.oci-containers.containers."anki" = {
    image = "ghcr.io/yangchuansheng/anki-sync-server:23.12.1";
    autoStart = true;
    ports = [ "${toString local-port}:8080" ];
    volumes = [ "/home/shreyas/services/anki:/ankisyncdir" ];
    environment = {
      "TZ" = "US/Eastern";
    };
    environmentFiles = [ config.sops.secrets.${anki-secret}.path ];
  };

  sops.secrets.${anki-secret} = { };
}
