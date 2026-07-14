{ config, ... }:
let
  grafana-password = "services/grafana/admin-password";
  grafana-secret-key = "services/grafana/secret-key";
  nextcloud-token = "services/nextcloud/metrics-token";
  inherit (config.services.prometheus) exporters;
in
{
  services.caddy.virtualHosts."roux.bigeye-beaver.ts.net" = {
    extraConfig = ''
      redir /grafana /grafana/
      reverse_proxy /grafana/* :${toString config.services.grafana.settings.server.http_port}
    '';
  };

  # enable caddy metrics
  services.caddy.globalConfig = ''
    servers {
      metrics
    }
  '';

  services.prometheus = {
    enable = true;
    port = 9090;
    listenAddress = "127.0.0.1";
    retentionTime = "30d";

    exporters = {
      node = {
        enable = true;
        enabledCollectors = [
          "systemd"
          "processes"
          "zfs"
        ];
        port = 9100;
      };

      postgres = {
        enable = true;
        port = 9187;
        runAsLocalSuperUser = true;
      };

      redis = {
        enable = true;
        port = 9121;
      };

      smartctl = {
        enable = true;
        port = 9633;
      };

      systemd = {
        enable = true;
        port = 9558;
      };

      #restic = {
      #  enable = true;
      #  port = 9753;
      #  repository = "rclone:b2:shreyas-backups";
      #  passwordFile = config.sops.secrets."backups/b2-restic/password".path;
      #  environmentFile = config.sops.secrets."backups/b2-restic/env".path;
      #  refreshInterval = 3600; # check every hour
      #};
    };

    scrapeConfigs = [
      {
        job_name = "node";
        static_configs = [
          {
            targets = [ "127.0.0.1:${toString exporters.node.port}" ];
          }
        ];
      }
      {
        job_name = "prometheus";
        static_configs = [
          {
            targets = [ "127.0.0.1:${toString config.services.prometheus.port}" ];
          }
        ];
      }
      {
        job_name = "postgres";
        static_configs = [
          {
            targets = [ "127.0.0.1:${toString exporters.postgres.port}" ];
          }
        ];
      }
      {
        job_name = "redis";
        static_configs = [
          {
            targets = [ "127.0.0.1:${toString exporters.redis.port}" ];
          }
        ];
      }
      {
        job_name = "smartctl";
        static_configs = [
          {
            targets = [ "127.0.0.1:${toString exporters.smartctl.port}" ];
          }
        ];
      }
      {
        job_name = "systemd";
        static_configs = [
          {
            targets = [ "127.0.0.1:${toString exporters.systemd.port}" ];
          }
        ];
      }
      {
        job_name = "caddy";
        static_configs = [
          {
            targets = [ "127.0.0.1:2019" ];
          }
        ];
      }
      #{
      #  job_name = "restic";
      #  static_configs = [
      #    {
      #      targets = [ "127.0.0.1:${toString exporters.restic.port}" ];
      #    }
      #  ];
      #  scrape_interval = "1h"; # match refresh interval
      #}
    ];
  };

  services.grafana = {
    enable = true;
    settings = {
      server = {
        http_port = 3000;
        http_addr = "127.0.0.1";
        root_url = "https://roux.bigeye-beaver.ts.net/grafana/";
        serve_from_sub_path = true;
      };
      security = {
        admin_user = "shreyas";
        admin_password = "$__file{${config.sops.secrets.${grafana-password}.path}}";
        secret_key = "$__file{${config.sops.secrets.${grafana-secret-key}.path}}";
      };
      analytics.reporting_enabled = false;
    };

    provision = {
      enable = true;
      datasources.settings.datasources = [
        {
          name = "Prometheus";
          type = "prometheus";
          url = "http://127.0.0.1:${toString config.services.prometheus.port}";
          isDefault = true;
        }
      ];
    };
  };

  sops.secrets.${grafana-password} = {
    owner = "grafana";
    group = "grafana";
  };

  sops.secrets.${grafana-secret-key} = {
    owner = "grafana";
    group = "grafana";
  };

  sops.secrets.${nextcloud-token} = { };
}
