{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    rust-lang.rust-analyzer
  ];
  settings = {
    "rust-analyzer.inlayHints.typeHints.enable" = false;
    "rust-analyzer.inlayHints.closingBraceHints.enable" = false;
    "rust-analyzer.inlayHints.parameterHints.enable" = false;
    # "rust-analyzer.cargo.features" = ["proc-macro"];
    # "rust-analyzer.server.path" = "${pkgs.rust-analyzer}/bin/rust-analyzer";
    "rust-analyzer.imports.granularity.enforce" = true;
  };
}
