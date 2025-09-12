{ pkgs, ... }:
{
  extensions = with pkgs.vscode-marketplace; [
    jeandeaual.lilypond-syntax
    lhl2617.lilypond-formatter
    lhl2617.lilypond-pdf-preview
    lhl2617.lilypond-snippets
    lhl2617.vslilypond
  ];
  settings = {
    "lilypondFormatter.general.useBundledPythonLy" = false;
  };
}
