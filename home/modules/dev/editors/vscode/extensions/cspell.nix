{ pkgs, ... }:
{
  extensions = with pkgs.vscode-marketplace; [
    streetsidesoftware.code-spell-checker
  ];
  settings = {
    "cSpell.enabled" = false;
  };
}
