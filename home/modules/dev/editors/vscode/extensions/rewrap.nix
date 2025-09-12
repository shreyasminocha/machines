_: {
  extensions = with pkgs.vscode-marketplace; [
    stkb.rewrap
  ];
  settings = {
    "rewrap.autoWrap.notification" = "text";
  };
}
