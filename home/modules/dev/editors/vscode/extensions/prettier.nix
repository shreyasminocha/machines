{ pkgs, ... }:
{
  extensions = with pkgs.vscode-marketplace; [
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
