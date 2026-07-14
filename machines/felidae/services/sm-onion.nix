{
  services.caddy.virtualHosts."http://shreyaspt3quhnn2aexii5j4d6h2bn5d6ekei6st5dw6m7sd7fn63iid.onion" =
    {
      extraConfig = ''
        bind unix//run/caddy/sm-onion.sock|0220

        root * /var/www/shreyasminocha.me
        file_server {
          hide .git
        }
      '';
    };

  services.tor = {
    relay.onionServices = {
      sm = {
        version = 3;
        map = [
          {
            port = 80;
            target = {
              unix = "/run/caddy/sm-onion.sock";
            };
          }
        ];
      };
    };
  };
}
