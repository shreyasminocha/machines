{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (python3.withPackages (
      python-pkgs: with python-pkgs; [
        requests
        numpy
        pandas
        matplotlib
        # ipykernel
        pip

        pygments # because it provides `pygmentize` which the latex package `minted` needs
      ]
    ))

    python313Packages.ipython

    black
    ty
  ];

  programs.ruff = {
    enable = true;
    settings = { };
  };
  programs.uv.enable = true;
}
