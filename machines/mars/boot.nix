{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 50;
        consoleMode = "auto";
      };
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "thunderbolt"
        "nvme"
        "uas"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [
        "dm-snapshot"
        "cryptd"
      ];
      systemd.enable = true;
    };

    kernelModules = [ "kvm-intel" ];
    kernelParams = [ "mem_sleep_default=deep" ];

    extraModulePackages = [ ];

    zfs = {
      allowHibernation = true;
      forceImportRoot = false;
    };
  };
}
