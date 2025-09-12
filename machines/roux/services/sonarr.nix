{
  services.sonarr = {
    enable = true;
    user = "shreyas";
    dataDir = "/var/sonarr";
  };

  services.caddy.virtualHosts."roux.bigeye-beaver.ts.net" = {
    extraConfig = ''
      redir /sonarr /sonarr/
      reverse_proxy /sonarr/* :8989
    '';
  };
}
