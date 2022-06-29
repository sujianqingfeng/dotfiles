local status, neoscroll = pcall(require, "neoscroll")
if not status then
    vim.notify("没有找到 neoscroll")
  return
end


neoscroll.setup()
