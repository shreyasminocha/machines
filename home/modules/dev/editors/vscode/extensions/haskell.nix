{ pkgs, ... }:
{
  extensions = with pkgs.vscode-marketplace; [
    haskell.haskell
    justusadam.language-haskell
  ];
  settings = {
    "haskell.manageHLS" = "GHCup";
  };
}
