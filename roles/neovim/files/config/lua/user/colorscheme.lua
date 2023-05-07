--[[ local catppuccin_status_ok, catppuccin = pcall(require, 'catppuccin') ]]
--[[ if not catppuccin_status_ok then ]]
--[[   return ]]
--[[ end ]]
--[[]]
--[[ catppuccin.setup { ]]
--[[   flavour = 'macchiato' ]]
--[[ } ]]
--[[]]
--[[ local colorscheme = 'catppuccin' ]]
--[[ local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme) ]]
--[[ if not status_ok then ]]
--[[   vim.notify('colorscheme ' .. colorscheme .. ' not found') ]]
--[[   return ]]
--[[ end ]]
local nightfox_status_ok, nightfox = pcall(require, 'nightfox')
if not nightfox_status_ok then
  return
end

nightfox.setup {
}

local colorscheme = 'nordfox'
local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not found')
  return
end
