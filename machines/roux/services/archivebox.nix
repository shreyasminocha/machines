let
  domain = "archivebox.shr.cx";
  local-port = 8035;
in
{
  services.caddy.virtualHosts.${domain} = {
    extraConfig = ''
      reverse_proxy 172.17.0.1:${toString local-port}
    '';
  };

  virtualisation.oci-containers.containers."archivebox" = {
    image = "archivebox/archivebox:0.8.5rc51";
    autoStart = true;
    ports = [ "172.17.0.1:${toString local-port}:8000" ];
    volumes = [ "/home/shreyas/services/archivebox:/data" ];
    environment = {
      "CSRF_TRUSTED_ORIGINS" = "https://${domain}";
      "ALLOWED_HOSTS" = "*";
      "PUBLIC_INDEX" = "false";
      "PUBLIC_SNAPSHOTS" = "false";
      "PUBLIC_ADD_VIEW" = "false";
    };
  };
}
