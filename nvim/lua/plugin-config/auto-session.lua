local status, session = pcall(require, "auto-session")
if not status then
    vim.notify("没有找到 auto-session")
  return
end


session.setup({
  log_level = 'info',
  auto_session_suppress_dirs = {'~/', '~/Projects'}
})




