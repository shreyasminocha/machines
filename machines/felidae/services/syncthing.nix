{
  services.syncthing = {
    enable = true;
    user = "shreyas";
    group = "users";
    configDir = "/home/shreyas/services/syncthing";
    overrideDevices = true;
    overrideFolders = true;
  };

  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [
    22000
    21027
  ];

  services.caddy.virtualHosts."roux.bigeye-beaver.ts.net" = {
    extraConfig = ''
      redir /syncthing /syncthing/
      handle_path /syncthing/* {
        reverse_proxy http://localhost:8384 {
          header_up Host {upstream_hostport}
        }
      }
    '';
  };

  systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true";
}
