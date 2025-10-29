{ pkgs-unstable, ... }:
let
  local-port = 8010;
in
{
  services.caddy.virtualHosts."pwd.minocha.family" = {
    extraConfig = ''
      reverse_proxy 172.17.0.1:${toString local-port}
    '';
  };

  #services.vaultwarden = {
  #  package = pkgs-unstable.vaultwarden;
  #  enable = true;
  #  config.ROCKET_PORT = local-port;
  #  webVaultPackage = pkgs-unstable.vaultwarden.webvault;
  #};

  virtualisation.oci-containers.containers."vaultwarden" = {
    image = "vaultwarden/server:1.34.1-alpine";
    autoStart = true;
    ports = [ "172.17.0.1:${toString local-port}:80" ];
    volumes = [ "/var/lib/vaultwarden:/data" ];
  };
}
