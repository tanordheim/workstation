local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
	return
end

lspconfig.yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = '/docker-compose.yml',
        ['https://json.schemastore.org/circleciconfig.json'] = '/.circleci/workflows.yml'
      },
    },
  }
}

