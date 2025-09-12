{ pkgs, ... }:
{
  programs.beets.enable = true;

  programs.beets.package = pkgs.beets-unstable.override {
    pluginOverrides = {
      alternatives = {
        enable = true;
        propagatedBuildInputs = [ pkgs.beetsPackages.alternatives ];
      };
      copyartifacts = {
        enable = true;
        propagatedBuildInputs = [ pkgs.beetsPackages.copyartifacts ];
      };
    };
  };

  programs.beets.settings = {
    library = "/var/music/library.db";
    directory = "/var/music";

    import = {
      write = true;
      copy = true;
      # incremental = true;
      timid = true;
      log = "/var/music/import.log";
    };

    musicbrainz = {
      external_ids = {
        discogs = "yes";
        spotify = "yes";
        bandcamp = "yes";
        beatport = "yes";
        deezer = "yes";
        tidal = "yes";
      };
    };

    match = {
      preferred = {
        countries = [
          "XW"
          "US"
          "IN"
        ];
        media = [
          "CD"
          "Digital Media|File|Web"
        ];
        original_year = "yes";
      };
    };

    item_fields = {
      first_artist = ''
        if albumartists and len(albumartists) > 0:
          return albumartists[0]

        if artists and len(artists) > 0:
          return artists[0]

        return albumartist or artist'';
    };

    paths = {
      default = "$first_artist/$album%aunique{}/$track $title";
      singleton = "$first_artist/$title/$title";
      comp = "Various Artists/$album%aunique{}/$track $title";
    };

    plugins = [
      "fetchart"
      "embedart"
      "thumbnails"
      "arttools"
      "lastgenre"
      "scrub"
      "inline"
      "advancedrewrite"
      "duplicates"
      # "mbcollection"
      "mbsync"
      "missing"
      "unimported"
      "badfiles"
      "edit"
      "info"
      "export"
      "fish"
      "convert"
      "hook"
      "alternatives"
      "copyartifacts"
      "web"
    ];

    # TODO: package this
    pluginpath = [ "/home/shreyas/beetsplug/beetsplug" ];

    fetchart = {
      auto = "yes";
      cautious = true;
      minwidth = 1000;
      enforce_ratio = true;
      source = "itunes";
      cover_format = "JPG";
    };

    embedart = {
      maxwidth = 500;
    };

    thumbnails = {
      dolphin = "yes";
    };

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

    lastgenre = {
      count = 5;
      min_weight = 40;
    };

    advancedrewrite = [ ];

    convert = {
      auto_keep = "yes";
      copy_album_art = "yes";
      dest = "/var/music-mp3-v0";
      never_convert_lossy_files = "yes";
      delete_originals = false;
      quiet = true;
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

    copyartifacts = {
      extensions = [
        ".cue"
        ".log"
      ];
      paths = {
        "ext:log" = "$albumpath/$album";
        "ext:cue" = "$albumpath/$album";
      };
    };

    export = {
      json = { };
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

    # web = {
    #   host = "127.0.0.1";
    #   port = 32010;
    #   reverse_proxy = true;
    # };

    # ftintitle = {
    #   auto = "no";
    #   drop = "yes";
    # };
  };

  # sops.secrets.${musicbrainz-password} = {};
}
