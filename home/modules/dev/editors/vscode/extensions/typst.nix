{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    myriad-dreamin.tinymist
  ];
  settings = {
    "tinymist.exportPdf" = "onSave";
    "tinymist.formatterMode" = "typstyle";
    # using the nixpkgs tinymist causes trouble
    # "tinymist.serverPath" = "${pkgs.tinymist}/bin/tinymist";
  };
}
