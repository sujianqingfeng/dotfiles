local status, tabby = pcall(require, 'tabby')
if not status then
    vim.notify('没有找到 tabby')
    return
end



local filename = require("tabby.filename")
require('colors')
local util = require("tabby.util")

local cwd = function()
  return "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
end

-- ֍ ֎ 

local line = {
  hl = "TabLineFill",
  layout = "active_wins_at_tail",
  head = {
    { cwd, hl = "EdenTLHead" },
    { "", hl = "EdenTLHeadSep" },
  },
  active_tab = {
    label = function(tabid)
      return {
        "  " .. tabid .. " ",
        hl = "EdenTLActive",
      }
    end,
    left_sep = { "", hl = "EdenTLActiveSep" },
    right_sep = { "", hl = "EdenTLActiveSep" },
  },
  inactive_tab = {
    label = function(tabid)
      return {
        "  " .. tabid .. " ",
        hl = "EdenTLBoldLine",
      }
    end,
    left_sep = { "", hl = "EdenTLLineSep" },
    right_sep = { "", hl = "EdenTLLineSep" },
  },
  top_win = {
    label = function(winid)
      return {
        "  " .. filename.unique(winid) .. " ",
        hl = "TabLine",
      }
    end,
    left_sep = { "", hl = "EdenTLLineSep" },
    right_sep = { "", hl = "EdenTLLineSep" },
  },
  win = {
    label = function(winid)
      return {
        "  " .. filename.unique(winid) .. " ",
        hl = "TabLine",
      }
    end,
    left_sep = { "", hl = "EdenTLLineSep" },
    right_sep = { "", hl = "EdenTLLineSep" },
  },
  tail = {
    { "", hl = "EdenTLHeadSep" },
    { "  ", hl = "EdenTLHead" },
  },
}



tabby.setup({
  tabline = line
})


-- keybindings

local map = vim.api.nvim_set_keymap
local opt = { noremap = true }

map("n", "<leader>ta", ":$tabnew<CR>", opt)

map("n", "<C-w>", ":tabclose<CR>", opt)

map("n", "<leader>to", ":tabonly<CR>", opt )

map("n", "<A-l>", ":tabn<CR>", opt)
map("n", "<A-h>", ":tabp<CR>",opt )
