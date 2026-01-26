{
  config,
  pkgs,
  ...
}:
let
  db-password = "services/nextcloud/db-password";
  admin-password = "services/nextcloud/admin-password";
in
{
  # https://wiki.nixos.org/wiki/Nextcloud#Use_Caddy_as_webserver
  imports = [
    "${
      fetchTarball {
        url = "https://github.com/onny/nixos-nextcloud-testumgebung/archive/fa6f062830b4bc3cedb9694c1dbf01d5fdf775ac.tar.gz";
        sha256 = "0gzd0276b8da3ykapgqks2zhsqdv4jjvbv97dsxg0hgrhb74z0fs";
      }
    }/nextcloud-extras.nix"
  ];

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud32;
    hostName = "cloud.minocha.family";
    webserver = "caddy";
    https = true;

    appstoreEnable = false;
    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps) contacts calendar;
    };
    # extraAppsEnable = true;

    config = {
      dbtype = "pgsql";
      dbuser = "nextcloud";
      dbname = "nextcloud";
      dbpassFile = config.sops.secrets.${db-password}.path;

      adminuser = "shreyas";
      adminpassFile = config.sops.secrets.${admin-password}.path;
    };
    settings = { };
    caching.redis = true;
    phpOptions = {
      "redis.host" = "localhost";
      "redis.port" = 6379;
    };
  };

  sops.secrets.${db-password} = {
    owner = "nextcloud";
    group = "nextcloud";
  };
  sops.secrets.${admin-password} = {
    owner = "nextcloud";
    group = "nextcloud";
  };
}
