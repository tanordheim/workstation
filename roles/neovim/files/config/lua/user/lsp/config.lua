local lsp_installer_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not lsp_installer_ok then
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
  'sumneko_lua',
  'terraformls',
  'yamlls'
}

lsp_installer.setup {
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
