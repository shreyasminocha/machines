{
  boot = {
    kernelModules = [
      "r8169"
      "kvm-intel"
    ];
    extraModulePackages = [ ];

    zfs.devNodes = "/dev/disk/by-id";

    loader.grub = {
      enable = true;
      zfsSupport = true;
      efiSupport = true;
      efiInstallAsRemovable = true;
      mirroredBoots = [
        {
          devices = [ "nodev" ];
          path = "/boot";
        }
      ];
    };

    initrd = {
      kernelModules = [ "r8169" ];
      availableKernelModules = [
        "r8169"
        "xhci_pci"
        "ahci"
        "nvme"
        "usb_storage"
        "usbhid"
        "sd_mod"
        "sdhci_pci"
        "usbcore"
        "uas"
      ];

      network = {
        enable = true;
        ssh = {
          enable = true;
          port = 1338;
          hostKeys = [ /etc/ssh/ssh_host_ed25519_key ];
          authorizedKeys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAQ4LwnAkJZfyMnwQySfzlZsCBC/Alxv8S4ZGIf4g05x shreyasminocha@mars"
          ];
        };
        udhcpc = {
          enable = true;
          extraArgs = [ "--timeout 30 --tryagain 20" ];
        };
        flushBeforeStage2 = true;
      };

      systemd.users.root.shell = "/bin/conspy";
    };
  };
}
