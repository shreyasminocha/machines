{ vscode-marketplace, ... }:
{
  extensions = [ ];
  settings = {
    "mypy-type-checker.importStrategy" = "fromEnvironment";
    "mypy-type-checker.path" = [
      "\"mypy\""
    ];
  };
}
