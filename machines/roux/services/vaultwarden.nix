{ pkgs-unstable, ... }:
let
  local-port = 8010;
in
{
  services.caddy.virtualHosts."pwd.minocha.family" = {
    extraConfig = ''
      reverse_proxy 127.0.0.1:${toString local-port}
    '';
  };

  # because `system.stateVersion` is 24.11, this uses /var/lib/bitwarden_rs
  # which is a little weird
  services.vaultwarden = {
    enable = true;
    package = pkgs-unstable.vaultwarden;
    webVaultPackage = pkgs-unstable.vaultwarden.webvault;
    domain = "https://pwd.minocha.family";
    config.SIGNUPS_ALLOWED = false;
    config.ROCKET_ADDRESS = "127.0.0.1";
    config.ROCKET_PORT = local-port;
    backupDir = "/var/backup/vaultwarden";
  };
}
