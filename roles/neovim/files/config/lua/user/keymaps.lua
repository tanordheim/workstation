local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- set <leader> key
vim.g.mapleader = ','
vim.g.maplocalleader = ','

--
-- normal mode
--

-- simplify window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- resize windows with array keys
keymap('n', '<C-Up>', ':resize -2<cr>', opts)
keymap('n', '<C-Down>', ':resize +2<cr>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<cr>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<cr>', opts)

-- navigate between buffers
keymap('n', '<S-l>', ':BufferLineCycleNext<cr>', opts)
keymap('n', '<S-h>', ':BufferLineCyclePrev<cr>', opts)

-- clear search highlights
keymap('n', '<leader><cr>', ':nohlsearch<cr>', opts)

-- nvim-tree
keymap('n', '<C-n>', ':NvimTreeToggle<cr>', opts)
keymap('n', '<leader>r', ':NvimTreeRefresh<cr>', opts)

-- telescope
keymap('n', '<leader>f', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<C-t>', '<cmd>Telescope live_grep<cr>', opts)

--
-- insert mode
--


--
-- visual mode
--

-- stay in indent mode after indenting
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- move text up and down
keymap('v', '<A-j>', ':m .+1<CR>==', opts)
keymap('v', '<A-k>', ':m .-2<CR>==', opts)
keymap('v', 'p', '"_dP', opts)

--
-- visual block mode
--

-- move text up and down
keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)
keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)
keymap('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
keymap('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)

--
-- terminal mode
--

-- improve terminal navigation
keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', term_opts)
keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', term_opts)
keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', term_opts)
keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', term_opts)
