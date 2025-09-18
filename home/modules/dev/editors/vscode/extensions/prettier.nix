{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    esbenp.prettier-vscode
  ];
  settings = {
    "prettier.disableLanguages" = [
      "json"
    ];
    "prettier.enabledLanguageIds" = [
    ];
    # "prettier.prettierPath" = "/usr/bin/prettier";
    "prettier.trailingComma" = "all";
  };
}
