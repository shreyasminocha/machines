let
  local-port = 8010;
in
{
  services.caddy.virtualHosts."pwd.minocha.family" = {
    extraConfig = ''
      reverse_proxy 172.17.0.1:${toString local-port}
    '';
  };

  virtualisation.oci-containers.containers."vaultwarden" = {
    image = "vaultwarden/server:1.34.1-alpine";
    autoStart = true;
    ports = [ "172.17.0.1:${toString local-port}:80" ];
    volumes = [ "/var/vaultwarden:/data" ];
  };
}
