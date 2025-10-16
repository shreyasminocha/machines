{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    golang.go
  ];
  settings = {
    gopls = {
      "ui.semanticTokens" = true;
    };
    "go.survey.prompt" = false;
  };
}
