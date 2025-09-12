{ pkgs, ... }:
{
  extensions = with pkgs.vscode-marketplace; [
    elijah-potter.harper
  ];
  settings = {
    "harper-ls.linters.sentence_capitalization" = false;
  };
}
