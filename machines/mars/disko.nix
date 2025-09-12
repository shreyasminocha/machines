{
  disko.devices = {
    disk = {
      root = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "4G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "nofail" ];
              };
            };
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "zroot";
              };
            };
          };
        };
      };
    };

    zpool = {
      zroot = {
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
            # mountpoint = "/";
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

          "swap" = {
            type = "zfs_volume";
            size = "32G";
            # content = {
            #   type = "swap";
            # };
            # options = {
            #   volblocksize = "4096";
            #   compression = "zle";
            #   logbias = "throughput";
            #   sync = "always";
            #   primarycache = "metadata";
            #   secondarycache = "none";
            #   "com.sun:auto-snapshot" = "false";
            # };
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

          "shreyas" =
            let
              path = "/home/shreyas";
            in
            {
              type = "zfs_fs";
              options.mountpoint = path;
              mountpoint = path;
            };

          "shreyas/documents" =
            let
              path = "/home/shreyas/documents";
            in
            {
              type = "zfs_fs";
              options.mountpoint = path;
              mountpoint = path;
            };

          "shreyas/hoard" =
            let
              path = "/home/shreyas/hoard";
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
