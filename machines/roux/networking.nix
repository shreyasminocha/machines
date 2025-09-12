{
  config,
  lib,
  pkgs,
  ...
}:
{
  networking.hostName = "roux";
  networking.hostId = "f950a906";

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

  networking.interfaces.enp1s0.useDHCP = true;
  networking.interfaces.enp2s0.useDHCP = true;
}
