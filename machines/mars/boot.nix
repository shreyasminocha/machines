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

    #resumeDevice = "/dev/disk/by-uuid/479878f2-fad6-4ae0-b660-547d58f05f5d";

    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };
}
