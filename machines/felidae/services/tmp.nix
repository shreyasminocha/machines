{
  services.caddy.virtualHosts."tmp.shr.cx" = {
    extraConfig = ''
      root * /var/www/tmp
      file_server
    '';
  };
}
