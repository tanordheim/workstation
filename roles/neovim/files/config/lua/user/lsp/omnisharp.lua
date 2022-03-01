local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
	return
end

local pid = vim.fn.getpid()

lspconfig.omnisharp.setup {
  cmd = { '/usr/bin/omnisharp', '--languageserver', '--hostPID', tostring(pid) },
  capabilities = require('user.lsp.handlers').capabilities,
  on_attach = require('user.lsp.handlers').on_attach
}
