{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    stkb.rewrap
  ];
  settings = {
    "rewrap.autoWrap.notification" = "text";
  };
}
