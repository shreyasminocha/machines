{ pkgs, vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    james-yu.latex-workshop
  ];
  settings =
    let
      viewer = "${pkgs.sioyek}/bin/sioyek";
    in
    {
      "latex-workshop.view.pdf.viewer" = "tab";
      "latex-workshop.bibtex-format.trailingComma" = true;
      "latex-workshop.bibtex-format.tab" = "4 spaces";
      "latex-workshop.latex.autoBuild.run" = "onSave";
      "latex-workshop.view.pdf.external.synctex.command" = viewer;
      "latex-workshop.view.pdf.external.viewer.command" = viewer;
      "latex-workshop.view.pdf.ref.viewer" = "external";
      "latex-workshop.view.pdf.external.synctex.args" = [
        "--inverse-search"
        "%PDF%"
        "%TEX%"
      ];
      "latex-workshop.latex.external.build.args" = [
        "%DOC%.tex"
        "--outdir"
        "%OUTDIR%"
        "--synctex"
      ];
      "latex-workshop.linting.chktex.enabled" = true;
      "latex-workshop.linting.chktex.exec.args" = [
        "-wall"
        "-n22"
        "-n30"
        "-e16"
        "-q"
        "-n46"
      ];
      "latex-workshop.view.pdf.trim" = 1;
      "latex-workshop.formatting.latex" = "tex-fmt";
      "latex-workshop.formatting.latexindent.args" = [
        "-c"
        "/tmp/"
        "%TMPFILE%"
        "-y=defaultIndent: '%INDENT%'"
      ];
      "latex-workshop.latex.external.build.command" = "tectonic";
      "latex-workshop.intellisense.citation.backend" = "biblatex";
      "latex-workshop.latex.autoClean.run" = "onSucceeded";
      "latex-workshop.latex.tools" = [
        {
          name = "latexmk";
          command = "latexmk";
          args = [
            "-shell-escape"
            "-synctex=1"
            "-interaction=nonstopmode"
            "-file-line-error"
            "-pdf"
            "-outdir=%OUTDIR%"
            "%DOC%"
          ];
          env = {
          };
        }
      ];
    };
}
