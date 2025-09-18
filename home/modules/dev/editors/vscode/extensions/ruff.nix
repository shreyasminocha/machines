{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    charliermarsh.ruff
  ];
  settings = {
    "ruff.lint.ignore" = [
      "F403"
    ];
  };
}
