{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Shreyas Minocha";
        email = "sm-git@riseup.net";
      };
      signing = {
        signByDefault = true;
        key = "0xAD8501B1B424968F";
      };

      push = {
        default = "current";
        autoSetupRemote = true;
      };
      pull.ff = "only";
      init.defaultBranch = "main";
      submodule.recurse = true;
      lfs.locksverify = false;

      alias =
        let
          update = "commit -m 'Update'";
        in
        {
          unstage = "reset HEAD --";
          undo = "reset HEAD~";
          resetfile = "checkout HEAD --";
          amend-now = "commit --amend --date=now";
          cane = "commit --amend --no-edit";
          lol = "log --oneline";
          last = "log -1";
          latest = "log -1";
          wtf = "blame";
          staash = "stash --include-untracked";
          sus = "!git stash --include-untracked && git stash apply";
          dad = "add .";
          yolo = update;
          update-commit = update;
          commit-update = update;
          force-push = "push --force-with-lease";
          commit-count = "rev-list --count HEAD";
          lazy = "!lazygit";
          diffn = "diff --no-ext-diff";
        };
    };

    ignores = [
      ".vscode/"
      "vgcore*"
      ".gdb_history"

      ".Trash-1000/"

      "*.pyc"
      ".mypy_cache"

      ".plan"
      ".stuff"
      ".notes"
      "*.todo"
      "todo"
      "*.tmp.*"
      "*.tmp"
      "*.bak"
      ".directory"

      ".DS_Store"

      ".env"
      "*.pem"
      "*.pub"
      "*.key"

      "*.log"
      "*.swp"

      ".attach_pid*"

      "*.fdb_latexmk"
      "*.flk"
      "*.synctex.gz"
      "*.fls"

      ".sync_*.db*"

      ".idea"
      "local.properties"
    ];

    lfs.enable = true;
  };

  programs.difftastic.enable = true;
  programs.difftastic.git.enable = true;

  programs.gh.enable = true;

  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        timeFormat = "2025-12-31";
        shortTimeFormat = "2359";
        nerdFontsVersion = "3";
        border = "single";
      };
      git = {
        # pagers.externalDiffCommand = "${lib.getExe pkgs.difftastic} --color=always";
        parseEmoji = true;
      };
      update.method = "never";
      disableStartupPopups = true;
    };
  };
  catppuccin.lazygit.enable = true;
}
