{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    jnoortheen.nix-ide
  ];
  settings = {
    "nix.enableLanguageServer" = true;
    "nix.serverSettings" = {
      "nil" = {
        "formatting" = {
          "command" = [ "nixfmt" ];
        };
      };
    };
  };
}
