{
  services.tor = {
    enable = true;

    openFirewall = true;
    enableGeoIP = false;

    client.enable = true;

    settings = { };
  };

  users.users.tor = {
    extraGroups = [ "caddy" ];
  };
}
