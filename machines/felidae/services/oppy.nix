{
  services.caddy.virtualHosts."oppy.prof" = {
    extraConfig = ''
      rewrite /hoppenheimer{uri}
      reverse_proxy https://sites.gatech.edu
    '';
  };
}
