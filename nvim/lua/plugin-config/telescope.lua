local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("没有找到 telescope")
  return
end

telescope.setup({
  defaults = {
    -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
    initial_mode = "insert",
    file_ignore_patterns = {"/node_modules/"},
    -- 窗口内快捷键
    mappings = {
      i = {
        -- 上下移动
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Down>"] = "move_selection_next",
        ["<Up>"] = "move_selection_previous",
        -- 历史记录
        ["<C-n>"] = "cycle_history_next",
        ["<C-p>"] = "cycle_history_prev",
        -- 关闭窗口
        ["<C-c>"] = "close",
        -- 预览窗口上下滚动
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down",
      },
    }
  },
  pickers = {
    -- 内置 pickers 配置
    -- find_files = {
      -- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
      -- theme = "dropdown",
    -- }
  },
  extensions = {
     -- 扩展插件配置
  },
})
