local treesitter_configs_status_ok, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if not treesitter_configs_status_ok then
  return
end

treesitter_configs.setup {
  ensure_installed = 'maintained',
  autopairs = {
    enable = true
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = { "yaml" }
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}