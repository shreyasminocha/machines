let
  local-port = 8083;
in
{
  services.calibre-web = {
    enable = true;
    listen = {
      ip = "127.0.0.1";
      port = local-port;
    };
    options = {
      calibreLibrary = "/media/books";
    };
  };

  services.caddy.virtualHosts."roux.bigeye-beaver.ts.net" = {
    extraConfig = ''
      redir /calibre /calibre/
      handle_path /calibre/* {
        reverse_proxy :${toString local-port} {
          header_up X-Scheme "https"
          header_up X-Script-Name "/calibre"
        }
      }
    '';
  };
}
