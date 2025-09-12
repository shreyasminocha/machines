{
  programs.git = {
    enable = true;
    userName = "Shreyas Minocha";
    userEmail = "sm-git@riseup.net";
    signing = {
      signByDefault = true;
      key = "0xAD8501B1B424968F";
    };

    aliases = {
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
      yolo = "commit -m 'Update'";
      force-push = "push --force-with-lease";
      commit-count = "rev-list --count HEAD";
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

    extraConfig = {
      push = {
        default = "current";
        autoSetupRemote = true;
      };
      pull = {
        ff = "only";
      };
      init = {
        defaultBranch = "main";
      };
      submodule = {
        recurse = true;
      };
      lfs = {
        locksverify = false;
      };
    };

    difftastic.enable = true;
    lfs.enable = true;
  };
}
