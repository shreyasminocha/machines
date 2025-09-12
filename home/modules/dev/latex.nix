{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tectonic
    (texliveFull.withPackages (ps: [ ps.chktex ]))
    ltex-ls
  ];

  programs.tex-fmt.enable = true;
}
