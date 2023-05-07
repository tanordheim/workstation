local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  vim.notify('installed packer to ' .. install_path)
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

-- auuto reload neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local packer_status_ok, packer = pcall(require, 'packer')
if not packer_status_ok then
  return
end

-- have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float()
    end,
  },
}

packer.startup(function(use)
  use('wbthomason/packer.nvim') -- have packer manage itself
  use('nvim-lua/popup.nvim')    -- an implementation of the Popup API from vim in Neovim
  use('nvim-lua/plenary.nvim')  -- lua convenience functions
  use('MunifTanjim/nui.nvim')   -- ui library

  -- icons
  use('kyazdani42/nvim-web-devicons')

  -- language server
  use({
    'williamboman/mason.nvim',
    run = ':MasonUpdate'
  })
  use('williamboman/mason-lspconfig.nvim')
  use('neovim/nvim-lspconfig')
  use('ray-x/lsp_signature.nvim')
  use('Hoffs/omnisharp-extended-lsp.nvim')
  use('lukas-reineke/lsp-format.nvim')

  -- snippets
  use('rafamadriz/friendly-snippets')
  use('L3MON4D3/LuaSnip')

  -- completion
  use('hrsh7th/cmp-nvim-lsp')
  use('saadparwaiz1/cmp_luasnip')
  use('hrsh7th/nvim-cmp')
  use('github/copilot.vim')

  -- comments
  use('numToStr/Comment.nvim')

  -- git
  use('lewis6991/gitsigns.nvim')

  -- treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  })
  use('JoosepAlviste/nvim-ts-context-commentstring')
  use('romgrk/nvim-treesitter-context')

  -- test runners
  use('vim-test/vim-test')

  -- telescope
  use({
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  })
  use('nvim-telescope/telescope.nvim')

  -- autopairs
  use('windwp/nvim-autopairs')

  -- neo-tree
  use({
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x'
  })

  -- lualine
  use('nvim-lualine/lualine.nvim')

  -- bufferline
  use('akinsho/bufferline.nvim')

  -- indentline
  use('lukas-reineke/indent-blankline.nvim')

  -- editor config support
  use('gpanders/editorconfig.nvim')

  -- diagnostics
  use('folke/trouble.nvim')

  -- which-key
  use('folke/which-key.nvim')

  -- symbol outline
  use('simrat39/symbols-outline.nvim')

  -- themes
  use({
    'catppuccin/nvim',
    as = 'catppuccin'
  })
  use('EdenEast/nightfox.nvim')

  -- automatically set up configuration after cloning packer.nvim
  -- must be last
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
