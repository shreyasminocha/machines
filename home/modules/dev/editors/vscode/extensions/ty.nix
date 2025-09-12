{ pkgs, ... }:
{
  extensions = with pkgs.vscode-marketplace; [
    astral-sh.ty
  ];
  settings = { };
}
