{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-treesitter;
        config = ''
          lua << EOF
            require("nvim-treesitter").setup({
              opts = {
                ensure_installed = {
                  "hyprlang",
                },
                auto_install = true,
                highlight = { enable = true },
              }
            })
          EOF
        '';
      }

      nvim-tree-lua

      {
        plugin = lualine-nvim;
        config = ''
          lua << EOF
            require("lualine").setup({
              options = {
                disabled_filetypes = { "NvimTree" }
              }
            })
          EOF
        '';
      }
      nvim-web-devicons

      {
        plugin = nvim-cokeline;
        config = ''
          lua << EOF
            show_if_buffers_are_at_least = 2
          EOF
        '';
      }

      plenary-nvim
    ];
    extraLuaConfig = ''
      vim.opt.number = true
      vim.opt.linebreak = true
      vim.opt.showbreak = "    "
      vim.opt.textwidth = 0
      vim.opt.showmatch = true
      vim.opt.visualbell = true

      vim.opt.smartcase = true
      vim.opt.ignorecase = true

      vim.opt.shiftwidth = 4
      vim.opt.smartindent = true
      vim.opt.tabstop = 4
      vim.opt.softtabstop = 4

      vim.opt.undolevels = 1000

      vim.opt.showmatch = true
      vim.opt.expandtab = true
      vim.opt.shiftwidth = 4
      vim.opt.autoindent = true
      vim.opt.wildmode = { longest, list }
      vim.opt.clipboard = unnamedplus
      vim.opt.swapfile = false

      vim.opt.showmode = false

      vim.opt.spell = true

      vim.keymap.set("", "<C-b>", "<cmd>NvimTreeToggle<cr>", {
        desc = "Toggle tree"
      })

      vim.opt.backupdir = os.getenv("HOME") .. "/.local/share/nvim/backup"

      -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close#beauwilliams
      vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("NvimTreeClose", {
          clear = true
        }),
        pattern = "NvimTree_*",
        callback = function()
          local layout = vim.api.nvim_call_function("winlayout", {})
          if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") ==
            "NvimTree" and layout[3] == nil then
            vim.cmd("confirm quit")
          end
        end
      })

      vim.filetype.add({
        pattern = { [ ".*/hyprland%.conf" ] = "hyprlang" },
      })
    '';
  };
  catppuccin.nvim.enable = true;
}
