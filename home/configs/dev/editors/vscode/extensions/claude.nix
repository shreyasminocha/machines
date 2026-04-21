{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    anthropic.claude-code
  ];
  settings = {
    "claudeCode.preferredLocation" = "panel";
  };
}
