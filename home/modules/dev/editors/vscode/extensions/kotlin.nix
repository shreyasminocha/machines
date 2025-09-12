_: {
  extensions = with pkgs.vscode-marketplace; [
    # TODO: figure out which one of these is better
    fwcd.kotlin
    mathiasfrohlich.kotlin
  ];
  settings = {
    "kotlin.inlayHints.chainedHints" = true;
  };
}
