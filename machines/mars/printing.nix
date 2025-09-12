{ pkgs, ... }:
{
  services.printing = {
    enable = true;
    drivers = with pkgs; [ cups-toshiba-estudio ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
