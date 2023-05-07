local symbols_outline_status_ok, symbols_outline = pcall(require, 'symbols-outline')
if not symbols_outline_status_ok then
  return
end

symbols_outline.setup {
  auto_preview = false,
  width = 10
}
