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
  };

  # maybe this is causing the crashes?
  # zramSwap.enable = true;

  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  services.smartd = {
    enable = true;
    devices = [
      { device = "/dev/nvme0"; }
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

      "/var/lib/systemd/random-seed"
      "/var/lib/logrotate.status"
    ];
  };
}
