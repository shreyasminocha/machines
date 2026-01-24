{ pkgs, ... }:
{
  sops = {
    # if this isn't a "string to the full path", it will be added to the store
    defaultSopsFile = "/etc/sops/secrets.yaml";
    validateSopsFiles = false;

    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    age.keyFile = "/var/lib/sops-nix/keys.txt";
  };

  imports = [
    ./nextcloud.nix
    ./tmp.nix
    ./vaultwarden.nix
    ./shreyas-slides.nix
    ./archivebox.nix
    ./jellyfin.nix
    ./forgejo.nix
    ./anki-sync.nix
    ./immich.nix
    ./syncthing.nix
    ./snowflake.nix
    ./sonarr.nix
    ./radarr.nix
    ./calibre.nix
    ./navidrome.nix
    ./maloja.nix
    ./archive-rice.nix
    ./mirrors.nix
    # ./soju.nix
  ];

  services.caddy = {
    enable = true;
  };

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    settings = {
      mysqld = {
        skip-bind-address = true; # TODO: fix networking mess and remove this
      };
    };
  };

  services.postgresql = {
    enable = true;
  };

  services.redis.servers."" = {
    enable = true;
    unixSocket = "/var/run/redis/redis.sock";
  };

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    daemon.settings = {
      data-root = "/home/shreyas/docker";
      userland-proxy = false;
    };
  };

  virtualisation.oci-containers = {
    backend = "docker";
  };
}
