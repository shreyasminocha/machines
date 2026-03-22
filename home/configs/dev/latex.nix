{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tectonic
    (texliveFull.withPackages (ps: [
      ps.chktex
      ps.biblatex-ieee
    ]))
    ltex-ls
    bibtex-tidy
  ];

  programs.tex-fmt.enable = true;
}
