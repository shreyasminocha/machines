let
  local-port = 42010;
in
{
  services.caddy.virtualHosts."roux.bigeye-beaver.ts.net:52010" = {
    extraConfig = ''
      reverse_proxy :42010
    '';
  };

  services.caddy.virtualHosts."roux.bigeye-beaver.ts.net" = {
    extraConfig = ''
      redir /maloja https://roux.bigeye-beaver.ts.net:52010
    '';
  };

  virtualisation.oci-containers.containers."maloja" = {
    image = "krateng/maloja:3.2.4";
    autoStart = true;
    # ports = [ "42010:${toString local-port}" ];
    extraOptions = [ "--network=host" ]; # to easily interface with navidrome
    volumes = [ "/var/maloja:/data" ];
    environment = {
      "MALOJA_DATA_DIRECTORY" = "/data";
      "PUID" = "1000";
      "PGID" = "100";
    };
  };
}
