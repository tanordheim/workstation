local symbols_outline_status_ok, symbols_outline = pcall(require, 'symbols-outline')
if not symbols_outline_status_ok then
  return
end

vim.g.symbols_outline = {
  auto_preview = false,
  width = 10
}
