{
  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  services.smartd = {
    enable = true;
    devices = [
      { device = "/dev/sda"; }
    ];
  };
}
