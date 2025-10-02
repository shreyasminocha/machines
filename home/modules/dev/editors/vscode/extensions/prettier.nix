{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    esbenp.prettier-vscode
  ];
  settings = {
    "prettier.trailingComma" = "all";
  };
}
