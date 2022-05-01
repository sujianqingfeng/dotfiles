vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }


-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Ctrl + hjkl  窗口之间跳转
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)


-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)



-- Terminal相关
-- map("n", "<leader>t", ":sp | terminal<CR>", opt)
-- map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
-- map("t", "<C-h>", [[ <C-\><C-N><C-w>h ]], opt)
-- map("t", "<C-j>", [[ <C-\><C-N><C-w>j ]], opt)
-- map("t", "<C-k>", [[ <C-\><C-N><C-w>k ]], opt)
-- map("t", "<C-l>", [[ <C-\><C-N><C-w>l ]], opt)



-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)


-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)

-- 退出
map("n", "q", ":q<CR>", opt)
-- map("n", "qq", ":q!<CR>", opt)
-- map("n", "Q", ":qa!<CR>", opt)

-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

-- 操作模式下 选择到行首行尾
map("o", "H", "^", opt)
map("o", "L", "$", opt)

-- neovide 有问题
-- 命令模式下 ctrl v粘贴第一个
-- map('c','<C-v>','<C-r>*',opt)



-- 插件快捷键
local pluginKeys = {}

-- bufferline
-- 左右Tab切换
map("n", "<A-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<A-l>", ":BufferLineCycleNext<CR>", opt)



-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)



-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  -- mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
  -- code action
  -- mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
  -- go xx
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)

  -- mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)

  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)

  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)

  -- mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
  -- diagnostic
  -- mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  -- mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  -- mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)

  mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
  mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
  mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- 没用到
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end


-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)


-- nvim-tree
map("n", "<C-b>", ":NvimTreeToggle<CR>", opt)
map("n","<leader>fc",":NvimTreeFindFile<CR>",opt)


-- typescript 快捷键
pluginKeys.mapTsLSP = function(mapbuf)
  mapbuf("n", "gs", ":TSLspOrganize<CR>", opt)
  mapbuf("n", "gr", ":TSLspRenameFile<CR>", opt)
  mapbuf("n", "gi", ":TSLspImportAll<CR>", opt)
end



return pluginKeys

