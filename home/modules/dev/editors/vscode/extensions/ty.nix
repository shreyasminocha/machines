{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    astral-sh.ty
  ];
  settings = {
    "ty.diagnosticMode" = "workspace";
    "ty.experimental.rename" = true;
    "ty.inlayHints.variableTypes" = false;
  };
}
