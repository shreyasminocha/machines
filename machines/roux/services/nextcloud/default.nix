{
  config,
  pkgs,
  ...
}:
let
  container-name = "nextcloud";
  db-password = "services/nextcloud/db-password";
  admin-password = "services/nextcloud/admin-password";
in
{
  services.caddy.virtualHosts."cloud.minocha.family" = {
    extraConfig = builtins.readFile ./Caddyfile;
  };

  virtualisation.oci-containers.containers.${container-name} = {
    image = "nextcloud:30.0.4-fpm-alpine";
    autoStart = true;
    # ports = [ "8020:9000" ];
    volumes = [
      "/var/www/nextcloud:/var/www/html"
      "/home/shreyas/services/nextcloud/data:/data"
    ];
    extraOptions = [
      "--network=host" # TODO: fix networking mess and remove this
    ];
    environment = {
      NC_dbtype = "mysql";
      NC_dbhost = "127.0.0.1:3306";
      NC_dbname = "nextcloud";
      NC_dbuser = "nextcloud";
      NC_datadirectory = "/data";
    };
    environmentFiles = [ config.sops.secrets.${db-password}.path ];
  };

  systemd.services."nextcloud-cron" = {
    path = [ pkgs.docker ];
    script = "docker exec -u www-data ${container-name} php /var/www/html/cron.php";
    serviceConfig = {
      User = "root";
    };
    startAt = "hourly";
  };

  sops.secrets.${db-password} = { };
}
