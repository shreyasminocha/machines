{
  fileSystems."/" = {
    fsType = "tmpfs";
    options = [ "mode=0755" ];
  };

  fileSystems."/persist" = {
    device = "system/persist";
    fsType = "zfs";
    neededForBoot = true;
  };

  fileSystems."/nix" = {
    device = "system/nix";
    fsType = "zfs";
    neededForBoot = true;
  };

  fileSystems."/var" = {
    device = "system/var";
    fsType = "zfs";
    neededForBoot = true;
  };

  fileSystems."/boot" = {
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  fileSystems."/tmp" = {
    fsType = "tmpfs";
  };

  fileSystems."/home" = {
    device = "system/home";
    fsType = "zfs";
  };

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

  environment.persistence."/persist" = {
    enable = true;
    hideMounts = true;
    directories = [
      "/mnt"
      "/lost+found"

      "/etc/ssh"
      "/etc/nixos"
      # "/etc/fwupd"

      {
        directory = "/etc/sops";
        user = "shreyas";
        mode = "u=rwx,g=rx,o=";
      }

      "/etc/NetworkManager/system-connections"
    ];
    files = [
      "/etc/resolv.conf.bak"
      "/etc/adjtime"
    ];
  };
}
