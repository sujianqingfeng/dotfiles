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


local colorscheme = "nightfox"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
  return
end

