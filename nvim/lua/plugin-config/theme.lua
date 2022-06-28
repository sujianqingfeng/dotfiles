local status, nightfox = pcall(require, "nightfox")
if not status then
  vim.notify("没有找到 nightfox")
  return
end


nightfox.setup({
  options = {
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic,bold",
    }
  }
})
