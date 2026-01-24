{ config, ... }:
let
  password = "services/freshrss/admin-password";
in
{
  services.freshrss = {
    enable = true;
    baseUrl = "https://rss.shr.cx";
    webserver = "caddy";
    virtualHost = "rss.shr.cx";
    defaultUser = "shreyas";
    passwordFile = config.sops.secrets.${password}.path;
  };

  sops.secrets.${password} = {
    owner = "freshrss";
    group = "freshrss";
  };
}
