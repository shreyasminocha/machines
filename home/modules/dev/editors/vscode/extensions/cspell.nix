{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    streetsidesoftware.code-spell-checker
  ];
  settings = {
    "cSpell.enabled" = false;
  };
}
