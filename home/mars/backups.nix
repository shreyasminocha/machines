{ config, ... }:
{
  services.syncthing = {
    enable = true;
    overrideDevices = true;
    overrideFolders = true;
  };

  services.syncthing.settings.folders = {
    "calibre" = {
      path = "${config.home.homeDirectory}/documents/calibre";
      type = "sendonly";
      devices = [ "roux" ];
    };
  };
}
