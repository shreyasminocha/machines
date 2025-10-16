{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    haskell.haskell
    justusadam.language-haskell
  ];
  settings = {
    "haskell.manageHLS" = "GHCup";
  };
}
