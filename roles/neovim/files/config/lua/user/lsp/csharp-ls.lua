local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
	return
end

lspconfig.csharp_ls.setup {
  handlers = {
    ['textDocument/definition'] = require('csharpls_extended').handler,
  },
  capabilities = require('user.lsp.handlers').capabilities,
  on_attach = require('user.lsp.handlers').on_attach
}
