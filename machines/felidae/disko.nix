{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "2G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "nofail" ];
              };
            };
            swap = {
              size = "8G";
              content = {
                type = "swap";
                randomEncryption = true;
                mountOptions = [ "nofail" ];
              };
            };
            system = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "system";
              };
            };
          };
        };
      };
    };

    zpool = {
      system = {
        type = "zpool";

        rootFsOptions = {
          mountpoint = "none";
          compression = "zstd";
          acltype = "posixacl";
          xattr = "sa";
        };

        options.ashift = "12";

        datasets = {
          "root" = {
            type = "zfs_fs";
            options = {
              encryption = "aes-256-gcm";
              keyformat = "passphrase";
              keylocation = "prompt";
            };
            mountpoint = "/";
          };

          "persist" = {
            type = "zfs_fs";
            options.mountpoint = "/persist";
            mountpoint = "/persist";
          };

          "nix" =
            let
              path = "/nix";
            in
            {
              type = "zfs_fs";
              options.mountpoint = path;
              mountpoint = path;
            };

          "var" =
            let
              path = "/var";
            in
            {
              type = "zfs_fs";
              options.mountpoint = path;
              mountpoint = path;
            };

          "home" =
            let
              path = "/home";
            in
            {
              type = "zfs_fs";
              options.mountpoint = path;
              mountpoint = path;
            };
        };
      };
    };
  };
}
