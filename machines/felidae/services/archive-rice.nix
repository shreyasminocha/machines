let
  domain = "archive.rice.university";
  local-port = 9030;
in
{
  services.caddy.virtualHosts.${domain} = {
    extraConfig = ''
      reverse_proxy 172.17.0.1:${toString local-port}
    '';
  };

  virtualisation.oci-containers.containers."archivebox-rice" = {
    image = "archivebox/archivebox:0.8.5rc51";
    autoStart = true;
    ports = [ "172.17.0.1:${toString local-port}:8000" ];
    volumes = [ "/var/archivebox-rice:/data" ];
    environment = {
      "CSRF_TRUSTED_ORIGINS" = "https://${domain}";
      "ALLOWED_HOSTS" = "*";
      "PUBLIC_INDEX" = "true";
      "PUBLIC_SNAPSHOTS" = "true";
      "PUBLIC_ADD_VIEW" = "false";
    };
  };
}
