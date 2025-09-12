{ pkgs, ... }:
{
  extensions = with pkgs.vscode-marketplace; [ ];
  settings = {
    "mypy-type-checker.importStrategy" = "fromEnvironment";
    "mypy-type-checker.path" = [
      "\"mypy\""
    ];
  };
}
