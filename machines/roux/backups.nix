{ config, ... }:
let
  b2-restic-env = "backups/b2-restic/env";
  b2-restic-repo = "backups/b2-restic/repo";
  b2-restic-password = "backups/b2-restic/password";
  commandz-restic-env = "backups/commandz-restic/env";
  commandz-restic-repo = "backups/commandz-restic/repo";
  commandz-restic-password = "backups/commandz-restic/password";
in
{
  services.sanoid = {
    enable = true;

    templates.snapshots = {
      hourly = 24;
      daily = 30;
      monthly = 3;
      autoprune = true;
      autosnap = true;
    };

    datasets."zpool" = {
      recursive = "zfs";
      useTemplate = [ "snapshots" ];
    };
  };

  # TODO: re-enable: disabled on the suspicion that it's
  # causing my crashes
  # services.mysqlBackup = {
  #   location = "/var/backup/mysql";
  # };
  # services.postgresqlBackup = {
  #   location = "/var/backup/postgresql";
  # };

  services.restic.backups.b2 = {
    initialize = true;

    repositoryFile = config.sops.secrets.${b2-restic-repo}.path;
    environmentFile = config.sops.secrets.${b2-restic-env}.path;
    passwordFile = config.sops.secrets.${b2-restic-password}.path;

    paths = [
      "/home/shreyas"
      "/home/shreyas/services"
      "/var/www"
      "/var/music"
      "/var/lib"
      "/etc"
    ];

    exclude = [
      "/home/shreyas/services/archivebox/archive"
      "/home/shreyas/services/nextcloud/data" # TODO: remove this
      "/home/shreyas/takeout"
      "/var/www/mirrors"
    ];

    pruneOpts = [
      "--keep-daily 7"
      "--keep-weekly 5"
      "--keep-monthly 12"
    ];

    timerConfig = {
      OnCalendar = "daily";
    };
  };

  services.restic.backups.commandz = {
    initialize = true;

    repositoryFile = config.sops.secrets.${commandz-restic-repo}.path;
    environmentFile = config.sops.secrets.${commandz-restic-env}.path;
    passwordFile = config.sops.secrets.${commandz-restic-password}.path;

    paths = [
      "/home/shreyas"
      "/home/shreyas/services"
      "/var/www"
      "/var/lib"
      "/etc"
      "/nix"
    ];

    exclude = [
      "/home/shreyas/services/archivebox/archive"
      "/home/shreyas/services/nextcloud/data"
      "/home/shreyas/takeout"
      "/var/www/mirrors"
    ];

    pruneOpts = [
      "--keep-daily 7"
      "--keep-weekly 5"
      "--keep-monthly 6"
    ];

    timerConfig = {
      OnCalendar = "daily";
    };
  };

  services.syncthing.settings.folders = {
    "music" = {
      path = "/var/music";
      type = "sendonly";
      devices = [ "orca" ];
      versioning = {
        type = "trashcan";
        params.cleanoutDays = "7";
      };
    };
    "music-mp3-v0" = {
      path = "/var/music-mp3-v0";
      type = "sendonly";
      devices = [ "mars" ];
      versioning = {
        type = "trashcan";
        params.cleanoutDays = "7";
      };
    };
    "photos" = {
      path = "/home/shreyas/services/immich/library/admin";
      type = "sendonly";
      devices = [ "mars" ];
    };
  };

  sops.secrets.${b2-restic-env} = { };
  sops.secrets.${b2-restic-repo} = { };
  sops.secrets.${b2-restic-password} = { };
  sops.secrets.${commandz-restic-env} = { };
  sops.secrets.${commandz-restic-repo} = { };
  sops.secrets.${commandz-restic-password} = { };
}
