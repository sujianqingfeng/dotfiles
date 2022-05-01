
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}


local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("没有找到 nvim-tree")
  return
end



nvim_tree.setup({
  git = {
    enable = true,
    ignore = true,

  },
  -- project plugin 需要这样设置
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  -- 隐藏 .文件 和 node_modules 文件夹
  filters = {
    dotfiles = true,
    custom = { "node_modules" },
  },
  view = {
    -- 宽度
    width = 30,
    height = 30,
    -- 也可以 'right'
    side = "left",
    -- 隐藏根目录
    hide_root_folder = false,
    -- 不显示行数
    number = false,
    relativenumber = false,
    -- 显示图标
    signcolumn = "yes",
    -- 自定义列表中快捷键
    mappings = {
      custom_only = false,
      list = {
        -- 打开文件或文件夹
        { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
        -- 分屏打开文件
        { key = "v", action = "vsplit" },
        { key = "h", action = "split" },
        -- 显示隐藏文件
        { key = "i", action = "toggle_ignored" }, -- Ignore (node_modules)
        { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
        -- 文件操作
        { key = "R", action = "refresh" },
        { key = "a", action = "create" },
        { key = "d", action = "remove" },
        { key = "r", action = "rename" },
        { key = "x", action = "cut" },
        { key = "c", action = "copy" },
        { key = "p", action = "paste" },
        { key = "s", action = "system_open" },
      },
    },
  },
  actions = {
    open_file = {
      resize_window = true,
      quit_on_open = false,
    }
  },
  -- npm install -g wsl-open
  -- https://github.com/4U6U57/wsl-open/
  system_open = {
    cmd = "wsl-open",
  },
})


require('nvim-tree.events').on_file_created(function (file)
  vim.cmd('edit '..file.fname)
end)
