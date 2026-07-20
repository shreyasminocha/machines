{
  fileSystems."/" = {
    fsType = "tmpfs";
    options = [ "mode=0755" ];
  };

  fileSystems."/persist" = {
    device = "zroot/persist";
    fsType = "zfs";
    neededForBoot = true;
  };

  fileSystems."/nix" = {
    device = "zroot/nix";
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
    device = "zroot/home";
    fsType = "zfs";
  };

  fileSystems."/home/shreyas/documents" = {
    device = "zroot/shreyas/documents";
    fsType = "zfs";
  };

  fileSystems."/home/shreyas/hoard" = {
    device = "zroot/shreyas/hoard";
    fsType = "zfs";
  };

  fileSystems."/mnt/plexus" = {
    device = "UUID=99b99604-0b95-49c7-a61c-3f0738fcb89f";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  zramSwap.enable = false;

  # hopefully fixes swap issues??
  # 2^33
  boot.extraModprobeConfig = ''
    options zfs zfs_arc_max=8589934592
  '';

  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  systemd.oomd.enable = true;

  services.smartd = {
    enable = true;
    devices = [
      { device = "/dev/disk/by-id/nvme-WD_BLACK_SN850X_4000GB_233504802512_1"; }
      { device = "/dev/disk/by-id/usb-_USB_DISK_3.2_07001B69A7A32E47-0:0"; }
    ];
  };

  environment.persistence."/persist" = {
    enable = true;
    hideMounts = true;
    directories = [
      "/mnt"
      "/lost+found"

      "/root/.config/frida"
      "/root/.cache" # conservative
      "/root/.gnupg"
      "/root/.android"

      "/var/log"
      "/var/lib/nixos"
      "/var/lib/docker"
      "/var/lib/bluetooth"
      "/var/lib/systemd/coredump"
      "/var/lib/NetworkManager"
      "/var/lib/tailscale"
      "/var/lib/fwupd"
      "/var/lib/vnstat"
      "/var/lib/cups"
      "/var/lib/lockdown"
      "/var/cache" # conservative

      "/etc/NetworkManager/system-connections"
      "/etc/fwupd"
      "/etc/ssh"
      {
        directory = "/etc/sops";
        user = "shreyas";
        mode = "u=rwx,g=rx,o=";
      }
    ];
    files = [
      "/etc/machine-id"
      "/etc/resolv.conf"
      "/etc/adjtime"
      "/etc/localtime"

      "/var/lib/systemd/random-seed"
      "/var/lib/logrotate.status"
    ];
  };
}
