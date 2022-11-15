local catppuccin_status_ok, catppuccin = pcall(require, 'catppuccin')
if not catppuccin_status_ok then
  return
end

vim.g.catppuccin_flavour = 'mocha'

catppuccin.setup {
}

local colorscheme = 'catppuccin'
local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not found')
  return
end
