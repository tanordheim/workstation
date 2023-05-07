local options = {
  backup = false,                          -- don't create backup files
  clipboard = 'unnamedplus',               -- use system clipboard
  cmdheight = 2,                           -- increase command line height
  completeopt = { 'menuone', 'noselect' }, -- improve completion experience (use a popupmenu, even when only one item, but don't auto select anything)
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = 'utf-8',                  -- default file encoding
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = '',                              -- disable mouse input
  pumheight = 10,                          -- pop up menu height
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- override ignorecase if search term contains an uppercase character
  smartindent = true,                      -- improve indenting behavior on new lines
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- dont create swap files
  termguicolors = true,                    -- enable 24bit colors in the terminal
  background = 'dark',                     -- dark terminal background mode
  timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds) - this essentially is the delay before which-key pops up
  undofile = true,                         -- enable persistent undo file
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = 'yes',                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- minimal number of lines to keep above/below cursor when scrolling
  sidescrolloff = 8,                       -- minimal number of columns to keep left/right of cursor when scrolling
  foldenable = false,                      -- disable folding by default
}

-- skip ins-completion-menu messages
vim.opt.shortmess:append 'c'

-- add characters to keyword detection
vim.cmd [[set iskeyword+=-]]

for k, v in pairs(options) do
  vim.opt[k] = v
end
