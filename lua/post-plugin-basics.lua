-- ################# Basic settings dependent on plugins ################ --

-- ================= Visualization ================= --

vim.o.termguicolors = true
vim.o.background = 'dark'
-- vim.cmd('colorscheme onedark')
require('onedark').setup()
vim.api.nvim_command('let g:palenight_terminal_italics=1')

