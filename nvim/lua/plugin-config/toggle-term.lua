
local status, toggleterm = pcall(require, "toggleterm")
if not status then
    vim.notify("没有找到 toggleterm")
  return
end



toggleterm.setup{
  -- size can be a number or function which is passed the current terminal
  size = 12,
  hide_numbers = true, -- hide the number column in toggleterm buffers
  
  shade_terminals = true,
  -- shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  -- direction = 'float',
  -- close_on_exit = true, -- close the terminal window when the process exits
  -- shell = 'pwsh.exe', -- change the default shell
  
}


-- 新建终端
local Terminal = require("toggleterm.terminal").Terminal




-- 新建浮动终端
local floatTerm =Terminal:new(
    {
        hidden = true,
        direction = "float",
        float_opts = {
            border = "double"
        },
    }
)

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float",})


-- 定义新的方法
function _float_toggle()
    floatTerm:toggle()
end


function _lazygit_toggle()
  lazygit:toggle()
end


local opts = {noremap = true,silent = true}
local map = vim.api.nvim_set_keymap
map("n", "<leader>tf", "<cmd>lua _float_toggle()<CR>", opts)
map("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", opts)
map("n", "<leader>t", "<cmd>exe v:count.'ToggleTerm'<CR>", opts)
map("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", opts)
map("n", "<C-`>", "<cmd>ToggleTermToggleAll<CR>", opts)



function _G.set_terminal_keymaps()
  local opts = {noremap = true,silent = true}
  local buffMap = vim.api.nvim_buf_set_keymap
  buffMap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  buffMap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  buffMap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  buffMap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  buffMap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  buffMap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)

end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
