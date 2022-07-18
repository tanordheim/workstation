local opts = {
  settings = {
    yaml = {
      schemas = {
        ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = '/docker-compose.yml',
        ['https://json.schemastore.org/circleciconfig.json'] = '/.circleci/workflows.yml'
      },
    },
  }
}
return opts
