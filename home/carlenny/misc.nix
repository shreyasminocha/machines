{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # TODO: these are deps of something else iirc
    lame
    sox
    python312Packages.eyed3

    sops
    ruby
    caddy
    sqlite

    lm_sensors
  ];

  programs.yt-dlp.enable = true;

  # roux-specific settings here
  programs.beets.settings = {
    library = "/var/music/library.db";
    directory = "/var/music";

    import = {
      log = "/var/music/import.log";
    };

    plugins = [
      "arttools"
      # "mbcollection"
    ];

    # TODO: package this
    pluginpath = [ "/home/shreyas/beetsplug/beetsplug" ];

    arttools = {
      size_thresh = 500;
      # aspect_ratio_thresh = 1.0;
      max_file_size = 52428800;
    };

    hook = {
      hooks = [
        {
          event = "item_imported";
          command = "beet artcollage -o /var/music/collage.jpg -s 100";
        }
      ];
    };

    convert = {
      dest = "/var/music-mp3-v0";
      formats = {
        mp3-v0 = {
          command = "/var/music-mp3-v0/encode $source $dest";
          extension = "mp3";
        };
      };
    };

    alternatives = {
      mp3-v0 = {
        directory = "/var/music-mp3-v0";
        formats = "mp3-v0";
        query = "";
      };
    };

    # musicbrainz = {
    #   user = "";
    #   pass = "";
    # };

    mbcollection = {
      auto = false;
      collection = "";
      remove = true;
    };
  };

  # TODO: fix duplication of these settings
  sops = {
    # if this isn't a "string to the full path", it will be added to the store
    defaultSopsFile = "/etc/sops/secrets.yaml";
    validateSopsFiles = false;

    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    age.keyFile = "/var/lib/sops-nix/keys.txt";
  };
}
