{ lib, ... }:
{
  networking.hostName = "felidae";
  networking.hostId = "3f9a2984";

  networking.networkmanager.enable = true;

  services.openssh = {
    enable = true;
    ports = [ 1337 ];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  services.fail2ban.enable = true;

  services.vnstat.enable = true;

  networking.firewall.allowedTCPPorts = [
    80
    443
    1337
  ];
  networking.firewall.allowedUDPPorts = [ ];

  networking.useDHCP = lib.mkDefault true;
  networking.interfaces.eno1.useDHCP = true;
  networking.interfaces.wlp0s29u1u8.useDHCP = true;
}
