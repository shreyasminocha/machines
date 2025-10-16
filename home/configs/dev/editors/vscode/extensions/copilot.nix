{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    github.copilot
  ];
  settings = {
    "github.copilot.enable" = {
      "*" = false;
      # plaintext = true;
      # markdown = true;
      # scminput = false;
      # yaml = false;
      # latex = true;
    };
    "github.copilot.advanced" = {
    };
  };
}
