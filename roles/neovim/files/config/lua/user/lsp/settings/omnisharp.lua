local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
  return
end

local pid = vim.fn.getpid()

local opts = {
  handlers = {
    ['textDocument/definition'] = require('omnisharp_extended').handler
  },
  cmd = { '/usr/bin/omnisharp', '--languageserver', '--verbose', '--hostPID', tostring(pid) },
}
return opts
