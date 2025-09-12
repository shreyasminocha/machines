{ pkgs, ... }:
{
  extensions = with pkgs.vscode-marketplace; [
    davidanson.vscode-markdownlint
  ];
  settings = {
    "markdownlint.config" = {
      line-length = false;
      ul-indent = {
        indent = 4;
      };
      heading-style = {
        style = "atx";
      };
      first-line-h1 = false;
      no-duplicate-heading = false;
      no-bare-urls = false;
    };
    "markdownlint.lintWorkspaceGlobs" = [
      "**/*.{md,mkd,mdwn,mdown,markdown,markdn,mdtxt,mdtext,workbook,mdx}"
      "!**/bower_components"
      "!**/node_modules"
      "!**/vendor"
      "!**/.git"
    ];
  };
}
