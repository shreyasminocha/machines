{
  services.prowlarr = {
    enable = true;
    dataDir = "/var/prowlarr";
    settings = {
      server.urlbase = "/prowlarr";
    };
  };

  services.caddy.virtualHosts."roux.bigeye-beaver.ts.net" = {
    extraConfig = ''
      redir /prowlarr /prowlarr/
      reverse_proxy /prowlarr/* :9696
    '';
  };
}
