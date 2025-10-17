{ pkgs, ... }:
{
  # flagged by the health check
  home.packages = with pkgs; [
    clang
    tree-sitter
  ];

  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    colorschemes.catppuccin.enable = true;

    opts = {
      number = true;
      linebreak = true;
      showbreak = "    ";
      textwidth = 0;
      showmatch = true;
      visualbell = true;

      smartcase = true;
      ignorecase = true;

      shiftwidth = 4;
      smartindent = true;
      tabstop = 4;
      softtabstop = 4;

      undolevels = 1000;

      expandtab = true;
      autoindent = true;
      wildmode = [
        "longest"
        "list"
      ];
      clipboard = "unnamedplus";
      swapfile = false;

      showmode = false;

      spell = true;

      shortmess = "ltToOCF" + "sI"; # default + hide welcome message

      relativenumber = true;
      signcolumn = "yes";
      colorcolumn = [
        80
        120
      ];
    };

    files = {
      "ftplugin/nix.lua" = {
        opts = {
          expandtab = true;
          shiftwidth = 2;
          tabstop = 2;
        };
      };
      "ftplugin/gitcommit.lua" = {
        opts = {
          colorcolumn = [
            50
            72
          ];
        };
      };
    };

    keymaps = [
      {
        key = "<C-b>";
        action = "<cmd>NvimTreeToggle<cr>";
      }
      {
        key = "<C-p>";
        action = "<cmd>Telescope find_files<cr>";
      }
      {
        key = "<C-f>";
        action = "<cmd>Telescope live_grep<cr>";
      }
    ];

    lsp = {
      servers = {
        astro.enable = true;
        html.enable = true;
        emmet_language_server.enable = true;
        cssls.enable = true;
        tailwindcss.enable = true;
        ts_ls.enable = true;

        nil_ls.enable = true;
        statix.enable = true;

        ruff.enable = true;
        clang.enable = true;
        rust_analyzer.enable = true;
        gopls.enable = true;

        texlab.enable = true;
        ltex.enable = true;
        tinymist.enable = true;
        marksman.enable = true;

        just.enable = true;
        fish_lsp.enable = true;
        jsonls.enable = true;
      };
    };

    plugins = {
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
    };

    # extraPlugins = with pkgs.vimPlugins; [ ];

    extraConfigLua = ''
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

      local bufferline = require('bufferline')
      bufferline.setup {
        options = {
          mode = "buffers", -- set to "tabs" to only show tabpages instead
          style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
          close_command = "bdelete! %d",
          -- tab_size = 18,
          diagnostics = "nvim_lsp",
          offsets = {
            {
              filetype = "NvimTree",
              text = "",
              text_align = "left",
              separator = true
            }
          },
          --  separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
          always_show_bufferline = false,
          auto_toggle_bufferline = true,
          sort_by = 'insert_at_end'
        }
      }
    '';
  };

  catppuccin.nvim.enable = true;
  home.sessionVariables.EDITOR = "nvim";
}
