{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    tecosaur.latex-utilities
    mblode.zotero
  ];
  settings = { };
}
