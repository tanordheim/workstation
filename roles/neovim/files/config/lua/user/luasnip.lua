local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_status_ok then
  return
end

require('luasnip/loaders/from_vscode').lazy_load()
