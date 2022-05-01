require('basic')
require('keybindings')
require('plugins')
require('colorscheme')
require('plugin-config.nvim-tree')
require("plugin-config.bufferline")
require('plugin-config.lualine')
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require('plugin-config.toggle-term')
require('plugin-config.autopairs')
require('plugin-config.comment')
require("plugin-config.indent-blankline")
require("plugin-config.gitsigns")
require("plugin-config.which-key")
require("plugin-config.surround")
require("plugin-config.auto-session")

-- 内置LSP
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")


-- 格式化
require("lsp.null-ls")

