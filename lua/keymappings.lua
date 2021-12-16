-- defaults
local opts = { noremap = true, silent = true }

-- mapping ESC to ć
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', opts)
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', opts)
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', opts)
vim.api.nvim_set_keymap('i', 'kk', '<ESC>', opts)

-- fast scrolling
vim.api.nvim_set_keymap('n', '<leader>n', '9j', opts)
vim.api.nvim_set_keymap('n', '<leader>u', '9k', opts)
vim.api.nvim_set_keymap('v', '<leader>n', '9j', opts)
vim.api.nvim_set_keymap('v', '<leader>u', '9k', opts)

-- Mapping U to Redo.
vim.api.nvim_set_keymap('', 'U', '<C-r>', opts)
vim.api.nvim_set_keymap('', '<C-r>', '<NOP>', opts)

-- indent via Tab
vim.api.nvim_set_keymap('n', '<Tab>', '>>_', opts)
vim.api.nvim_set_keymap('n', '<S-Tab>', '<<_', opts)
vim.api.nvim_set_keymap('v', '<Tab>', '>>_', opts)
vim.api.nvim_set_keymap('v', '<S-Tab>', '<<_', opts)
vim.api.nvim_set_keymap('i', '<Tab>', '\t', opts)
vim.api.nvim_set_keymap('i', '<S-Tab>', '\b', opts)

-- window movement
vim.api.nvim_set_keymap('', '<C-h>', '<C-w>h', opts)
vim.api.nvim_set_keymap('', '<C-j>', '<C-w>j', opts)
vim.api.nvim_set_keymap('', '<C-k>', '<C-w>k', opts)
vim.api.nvim_set_keymap('', '<C-l>', '<C-w>l', opts)

-- opening terminal with shortcut
vim.api.nvim_set_keymap('', '<Leader><CR>', '<Cmd>silent !$TERM &<CR>', opts)

-- jumping back and forth
vim.api.nvim_set_keymap('', '<C-K>', '<C-O>', opts)
vim.api.nvim_set_keymap('', '<C-L>', '<C-I>', opts)

-- autocomplete
-- if autocomplete popup menu opens pressing enter will complete the first match
-- vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? "<C-n><Esc>a" : "<CR>"', {expr = true, noremap = true, silent = true})

-- Alternate way to quit
vim.cmd('nnoremap <S-c> :q!<CR>')

-- Alternate way to save
vim.cmd('nnoremap <C-s> :w!<CR>')
vim.cmd('inoremap <C-s> <ESC> :w!<CR>')

-- Toggle highlighting
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', opts)

-- LSP info
vim.api.nvim_set_keymap('n', '<Leader>li', ':LspInfo<CR>', opts)
