local bufferline_status_ok, bufferline = pcall(require, 'bufferline')
if not bufferline_status_ok then
  return
end

local function diagnostics_indicator(_, _, diagnostics)
  local result = {}
  local symbols = { error = '', warning = '', info = '' }
  for name, count in pairs(diagnostics) do
    if symbols[name] and count > 0 then
      table.insert(result, symbols[name] .. count)
    end
  end
  result = table.concat(result, ' ')
  return #result > 0 and result or ''
end

bufferline.setup {
  highlights = {
    background = {
      gui = 'italic'
    },
    buffer_selected = {
      gui = 'bold'
    },
  },
  options = {
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = diagnostics_indicator,
    show_buffer_close_icons = true,
    show_close_icon = false,
    separator_style = 'thin',
    always_show_bufferline = 'false',
    sort_by = 'id',
    offsets = {
      {
        filetype = 'undotree',
        text = 'Undotree',
        highlight = 'PanelHeading',
        padding = 1,
      },
      {
        filetype = 'NvimTree',
        text = 'Explorer',
        highlight = 'PanelHeading',
        padding = 1,
      },
      {
        filetype = 'DiffviewFiles',
        text = 'Diff View',
        highlight = 'PanelHeading',
        padding = 1,
      },
      {
        filetype = 'flutterToolsOutline',
        text = 'Flutter Outline',
        highlight = 'PanelHeading',
      },
      {
        filetype = 'packer',
        text = 'Packer',
        highlight = 'PanelHeading',
        padding = 1,
      },
    },
  },
}
