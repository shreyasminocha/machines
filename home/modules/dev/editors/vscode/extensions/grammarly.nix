{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
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
