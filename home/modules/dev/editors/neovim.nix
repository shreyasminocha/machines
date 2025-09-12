{
  programs.neovim = {
    enable = true;
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
      vim.opt.wildmode = {longest, list}
      vim.opt.clipboard = unnamedplus
      vim.opt.swapfile = false

      vim.opt.showmode = false

      vim.keymap.set("", "<C-b>", "<cmd>NvimTreeToggle<cr>", {
          desc = "Toggle tree"
      })

      vim.opt.backupdir = os.getenv("HOME") .. "/.local/share/nvim/backup"

      local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
      if not (vim.uv or vim.loop).fs_stat(lazypath) then
          vim.fn.system(
              {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
               lazypath})
      end

      vim.opt.rtp:prepend(lazypath)

      require("lazy").setup({{
          "nvim-lualine/lualine.nvim",
          dependencies = {"nvim-tree/nvim-web-devicons"}
      }, "nvim-tree/nvim-tree.lua", "marko-cerovac/material.nvim",
      {
          "nvim-treesitter/nvim-treesitter",
          opts = {
              ensure_installed = {
                  "hyprlang",
              },
              auto_install = true,
              highlight = { enable = true },
          }
      }, {
          "willothy/nvim-cokeline",
          dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons"}
      }}, {})

      require("lualine").setup({
          options = {
              disabled_filetypes = {"NvimTree"}
          }
      })

      require("nvim-tree").setup()

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

      require("cokeline").setup({
          show_if_buffers_are_at_least = 2
      })

      require("material").setup()
      vim.cmd "colorscheme material"
      vim.g.material_style = "ocean"

      vim.filetype.add({
          pattern = { [".*/hyprland%.conf"] = "hyprlang" },
      })
    '';
  };
}
