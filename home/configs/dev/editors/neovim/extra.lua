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
