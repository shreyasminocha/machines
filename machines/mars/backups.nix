{ config, ... }:
let
  b2-restic-env = "backups/b2-restic/env";
  b2-restic-repo = "backups/b2-restic/repo";
  b2-restic-password = "backups/b2-restic/password";
in
{
  services.sanoid = {
    enable = true;

    templates.snapshots = {
      hourly = 24;
      daily = 30;
      monthly = 12;
      autoprune = true;
      autosnap = true;
    };

    templates.exclude.autosnap = false;

    datasets."zroot" = {
      recursive = "zfs";
      useTemplate = [ "snapshots" ];
    };
  };

  services.restic.backups.b2 = {
    initialize = true;

    repositoryFile = config.sops.secrets.${b2-restic-repo}.path;
    environmentFile = config.sops.secrets.${b2-restic-env}.path;
    passwordFile = config.sops.secrets.${b2-restic-password}.path;

    paths = [
      "/home/shreyas/documents"
    ];

    exclude = [ ];

    pruneOpts = [
      "--keep-daily 7"
      "--keep-weekly 5"
      "--keep-monthly 6"
    ];

    timerConfig = {
      OnCalendar = "daily";
    };
  };

  sops.secrets.${b2-restic-env} = { };
  sops.secrets.${b2-restic-repo} = { };
  sops.secrets.${b2-restic-password} = { };
}
