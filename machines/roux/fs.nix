{
  fileSystems."/" = {
    device = "zpool/root";
    fsType = "zfs";
  };

  fileSystems."/nix" = {
    device = "zpool/nix";
    fsType = "zfs";
  };

  fileSystems."/var" = {
    device = "zpool/var";
    fsType = "zfs";
  };

  fileSystems."/home" = {
    device = "zpool/home";
    fsType = "zfs";
  };

  fileSystems."/media" = {
    device = "zpool/media";
    fsType = "zfs";
  };

  fileSystems."/archive" = {
    device = "zpool/archive";
    fsType = "zfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  swapDevices = [ { device = "/dev/disk/by-label/swap"; } ];

  services.smartd = {
    enable = true;
    devices = [
      { device = "/dev/sda"; }
      { device = "/dev/nvme0n1"; }
    ];
  };
}
