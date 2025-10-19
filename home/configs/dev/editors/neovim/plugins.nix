{
  lspconfig.enable = true;

  lualine = {
    enable = true;
    settings = {
      options.disabled_filetypes = [ "NvimTree" ];
    };
  };
  nvim-tree.enable = true;
  web-devicons.enable = true;
  bufferline.enable = true;
  telescope.enable = true;
  render-markdown.enable = true;

  guess-indent.enable = true;
  trim.enable = true;
  toggleterm.enable = true;
  gitsigns.enable = true;

  treesitter = {
    enable = true;
    settings = {
      auto_install = false;
      ensure_installed = [ ];
      highlight.enable = true;
    };
  };
}
