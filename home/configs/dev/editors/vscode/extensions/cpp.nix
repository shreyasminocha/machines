{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    ms-vscode.cpptools
    ms-vscode.cpptools-extension-pack
  ];
  settings = {
    "C_Cpp.clang_format_fallbackStyle" =
      "{ BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Always }";
    "C_Cpp.default.cppStandard" = "gnu++23";
  };
}
