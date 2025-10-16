{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    pkief.material-icon-theme
  ];
  settings = {
    "material-icon-theme.activeIconPack" = "none";
    "material-icon-theme.folders.associations" = {
      _layouts = "views";
      _drafts = "temp";
      _posts = "markdown";
      _site = "dist";
      _plugins = "plugin";
      _sass = "sass";
      _pages = "markdown";
      _includes = "include";
      partials = "include";
    };
    "material-icon-theme.languages.associations" = {
      fish = "console";
      dotenv = "tune";
      "literate haskell" = "haskell";
      smali = "android";
      svelte = "svelte";
    };
    "material-icon-theme.files.associations" = {
      "*.out" = "exe";
      "*.sbatch" = "sh";
      "*.sage" = "mathematica";
    };
  };
}
