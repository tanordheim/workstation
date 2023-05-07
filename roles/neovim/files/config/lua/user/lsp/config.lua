local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then
  return
end
local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_ok then
  return
end
local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then
  return
end

local servers = {
  'jsonls',
  'omnisharp',
  'pyright',
  'lua_ls',
  'terraformls',
  'yamlls'
}

mason.setup {}

mason_lspconfig.setup {
  ensure_installed = servers
}

for _, server in pairs(servers) do
  local opts = {
    on_attach = require('user.lsp.handlers').on_attach,
    capabilities = require('user.lsp.handlers').capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, 'user.lsp.settings.' .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
  end
  lspconfig[server].setup(opts)
end
