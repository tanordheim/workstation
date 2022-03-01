local treesitter_context_status_ok, treesitter_context = pcall(require, 'treesitter-context')
if not treesitter_context_status_ok then
  return
end

treesitter_context.setup {
}
