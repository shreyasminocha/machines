{ pkgs, ... }:
{
  extensions = with pkgs.vscode-marketplace; [
    charliermarsh.ruff
  ];
  settings = {
    "ruff.lint.ignore" = [
      "F403"
    ];
  };
}
