{ pkgs, ... }:
{
  extensions = with pkgs.vscode-marketplace; [
    yzhang.markdown-all-in-one
  ];
  settings = {
    "markdown.preview.fontFamily" = "Roboto";
    "markdown.preview.markEditorSelection" = false;
    "markdown.preview.lineHeight" = {
    };
    "markdown.preview.fontSize" = 16;
    "markdown.preview.typographer" = true;
  };
}
