{
  services.radarr = {
    enable = true;
    user = "shreyas";
    dataDir = "/var/radarr";
  };

  services.caddy.virtualHosts."roux.bigeye-beaver.ts.net" = {
    extraConfig = ''
      redir /radarr /radarr/
      reverse_proxy /radarr/* :7878
    '';
  };
}
