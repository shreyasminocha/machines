{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # flagged by the health check
    clang
    tree-sitter
  ];

  home.sessionVariables.EDITOR = "nvim";

  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    colorschemes.catppuccin.enable = true;

    opts = import ./opts.nix;

    files = import ./filetypes.nix;

    keymaps = import ./binds.nix;

    lsp = import ./lsp.nix;
    plugins = import ./plugins.nix;
    # extraPlugins = with pkgs.vimPlugins; [ ];

    extraConfigLua = builtins.readFile ./extra.lua;
  };

  catppuccin.nvim.enable = true;
}
