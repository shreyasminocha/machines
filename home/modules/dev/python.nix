{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python3
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
