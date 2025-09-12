{ pkgs, ... }:
{
  extensions = with pkgs.vscode-marketplace; [
    github.copilot
  ];
  settings = {
    "github.copilot.enable" = {
      "*" = true;
      plaintext = true;
      markdown = true;
      scminput = false;
      yaml = false;
      latex = true;
    };
    "github.copilot.advanced" = {
    };
  };
}
