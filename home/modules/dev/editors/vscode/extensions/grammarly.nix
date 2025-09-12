{ pkgs, ... }:
{
  extensions = with pkgs.vscode-marketplace; [
    znck.grammarly
  ];
  settings = {
    "grammarly.files.include" = [
      "**/readme.md"
      "**/README.md"
      "**/*.txt"
      "**/*.md"
      "**/*.typ"
    ];
  };
}
