{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    astral-sh.ty
  ];
  settings = {
    "ty.diagnosticMode" = "workspace";
  };
}
