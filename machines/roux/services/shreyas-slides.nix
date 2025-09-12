{
  services.caddy.virtualHosts."slides.shr.cx" = {
    extraConfig = ''
      root * /var/www/slides
      file_server {
        hide .git
      }
    '';
  };
}
