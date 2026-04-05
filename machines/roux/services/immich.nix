{
  config,
  pkgs,
  ...
}:
let
  immich-secret = "services/immich/env";
in
{
  services.caddy.virtualHosts."pics.minocha.family" = {
    extraConfig = ''
      reverse_proxy localhost:2283
    '';
  };

  services.immich = {
    enable = true;
    port = 2283;
    database = {
      user = "immich";
      name = "immich";
    };
    secretsFile = config.sops.secrets.${immich-secret}.path;
    mediaLocation = "/var/lib/immich";
    machine-learning.enable = false; # too weak a machine
  };

  services.redis.servers.immich = {
    enable = true;
  };

  services.postgresql.extensions = [ pkgs.postgresql15Packages.pgvecto-rs ];
  services.postgresql.settings.shared_preload_libraries = [ "vectors.so" ];

  sops.secrets.${immich-secret} = { };
}
