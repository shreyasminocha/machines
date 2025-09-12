{ pkgs, ... }:
{
  extensions = with pkgs.vscode-marketplace; [
    jnoortheen.nix-ide
  ];
  settings = {
    "nix.enableLanguageServer" = true;
  };
}
