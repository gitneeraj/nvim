local opts = {silent = true, noremap = true}
vim.api.nvim_set_keymap('n', '<leader>e',
                        ":lua require'plugin-config.nvim-tree-conf'.toggle_tree()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>r', '<Cmd>NvimTreeRefresh<CR>', opts)
-- find the currently open file in tree
vim.api.nvim_set_keymap('n', '<leader>f', '<Cmd>NvimTreeFindFile<CR>', opts)

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local list = {
  {key = "<C-t>", cb = tree_cb("tabnew")}, {key = "<CR>", cb = tree_cb("edit")},
  {key = "o", cb = tree_cb("edit")}, {key = "<2-LeftMouse>", cb = tree_cb("edit")},
  {key = "<2-RightMouse>", cb = tree_cb("cd")}, {key = "<Tab>", cb = tree_cb("preview")},
  {key = "R", cb = tree_cb("refresh")}, {key = "a", cb = tree_cb("create")},
  {key = "d", cb = tree_cb("remove")}, {key = "r", cb = tree_cb("rename")},
  {key = "x", cb = tree_cb("cut")}, {key = "y", cb = tree_cb("copy")},
  {key = "p", cb = tree_cb("paste")}, {key = "<", cb = tree_cb("dir_up")},
  {key = "q", cb = tree_cb("close")}
}

require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  update_to_buf_dir = {enable = true, auto_open = true},
  diagnostics = {
    enable = true,
    icons = {hint = "", info = "", warning = "", error = ""}
  },
  update_focused_file = {enable = true, update_cwd = true, ignore_list = {}},
  system_open = {cmd = nil, args = {}},
  git = {enable = true, ignore = true},
  filters = {dotfiles = false, custom = {}},
  view = {
    width = NVIMTREE_WIDTH,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {custom_only = false, list = list}
  }
}

local view = require 'nvim-tree.view'

local _M = {}
_M.toggle_tree = function()
  if view.is_visible() then
    view.close()
    require'bufferline.state'.set_offset(0)
  else
    require'bufferline.state'.set_offset(NVIMTREE_WIDTH, 'File Explorer')
    require'nvim-tree'.find_file(true)
  end

end

return _M
