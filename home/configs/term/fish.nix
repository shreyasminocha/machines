{
  programs.fish = {
    enable = true;
    shellAliases = {
      "g" = "git";
      "y" = "yazi";
      "ls" = "eza";
      "l" = "eza -la";
      "tree" = "tre";
      "gdb" = "pwndbg";
      "vsc" = "codium";
      "melt" = "nix-melt";
      "ffs" = "sudo";
      "ydl" = "yt-dlp";
      "nt" = "npm test";
      "nr" = "npm run";
      "is-this-thing-on" = "ping -c 3 example.com";
      "pbcopy" = "wl-copy";
      "pbpaste" = "wl-paste";
      "rgi" = "rg -i";
      "batnw" = "bat --wrap=never";
      "ff" = "fastfetch";
    };
    functions = {
      envsource = {
        description = "source and export a .env file";
        body = ''
          for line in (cat $argv | grep -v '^#')
            set item (string split -m 1 '=' $line)
            set -gx $item[1] $item[2]
            echo "Exported '$item[1]'"
          end
        '';
      };
    };
    shellInit = ''
      fish_add_path "$HOME/documents/bin"
    '';
    interactiveShellInit = ''
      set fish_greeting
    '';
  };
  catppuccin.fish.enable = true;
}
