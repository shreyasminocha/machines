{
  services.radarr = {
    enable = true;
    user = "shreyas";
    dataDir = "/var/radarr";
  };

  # TODO: not sure if this was for sonarr or radarr
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-sdk-6.0.428"
    "aspnetcore-runtime-6.0.36"
  ];

  services.caddy.virtualHosts."roux.bigeye-beaver.ts.net" = {
    extraConfig = ''
      redir /radarr /radarr/
      reverse_proxy /radarr/* :7878
    '';
  };
}
