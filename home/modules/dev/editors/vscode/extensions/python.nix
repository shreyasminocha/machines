{ pkgs, vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    ms-python.python
    ms-python.black-formatter
    ms-python.debugpy
  ];
  settings = {
    "python.defaultInterpreterPath" = pkgs.python312;
    "python.experiments.enabled" = false;
    "black-formatter.importStrategy" = "fromEnvironment";
  };
}
