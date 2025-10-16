{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tectonic
    (texliveFull.withPackages (ps: [ ps.chktex ]))
    ltex-ls
    bibtex-tidy
  ];

  programs.tex-fmt.enable = true;
}
