{
  config,
  pkgs,
  ...
}:
let
  version = "v2.4.1";
  immich-secret = "services/immich/env";
  container-redis-socket = "/var/run/redis/redis.sock";
in
{
  services.caddy.virtualHosts."pics.minocha.family" = {
    extraConfig = ''
      reverse_proxy :2283
    '';
  };

  virtualisation.oci-containers.containers."immich" = {
    image = "ghcr.io/immich-app/immich-server:${version}";
    autoStart = true;
    # ports = [ "8060:2283" ];
    volumes = [
      "/home/shreyas/services/immich:/usr/src/app/upload"
      "/var/run/redis/redis.sock:${container-redis-socket}"
    ];
    extraOptions = [
      "--network=host" # TODO: fix networking mess and remove this
    ];
    environment = {
      IMMICH_VERSION = version;
      DB_HOSTNAME = "127.0.0.1";
      DB_DATABASE_NAME = "immich";
      DB_USERNAME = "immich";
      REDIS_SOCKET = container-redis-socket;
    };
    environmentFiles = [ config.sops.secrets.${immich-secret}.path ];
  };

  services.postgresql.extensions = [ pkgs.postgresql15Packages.pgvecto-rs ];
  services.postgresql.settings.shared_preload_libraries = [ "vectors.so" ];

  sops.secrets.${immich-secret} = { };
}
