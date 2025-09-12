{ pkgs, ... }:
{
  extensions = with pkgs.vscode-marketplace; [
    valentjn.vscode-ltex
  ];
  settings = {
    "ltex.additionalRules.motherTongue" = "en-GB";
    "ltex.additionalRules.enablePickyRules" = true;
    "ltex.language" = "en-GB";
    "ltex.disabledRules" = {
      en-GB = [
        "WHITESPACE_RULE"
      ];
    };
    # TODO: ltex isn't working
    # this needs to be set btw because if it isn't, it'll try to download ltex to the read-only fs
    "ltex.ltex-ls.path" = pkgs.ltex-ls;
  };
}
