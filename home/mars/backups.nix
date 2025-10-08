{
  services.syncthing = {
    enable = true;
    overrideDevices = true;
    overrideFolders = true;
  };

  services.syncthing.settings.folders = {
    "calibre" = {
      path = "/home/shreyas/documents/calibre";
      type = "sendonly";
      devices = [ "roux" ];
    };
  };
}
