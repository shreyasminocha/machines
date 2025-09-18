{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    elijah-potter.harper
  ];
  settings = {
    "harper-ls.linters.sentence_capitalization" = false;
  };
}
