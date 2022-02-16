require'nvim-treesitter.configs'.setup {
  -- will install treesitter for all available languages
  ensure_installed = 'all',
  ignore_install = {"haskell", "phpdoc"}, -- broken
  highlight = {
    enable = true
  },
  indent = {enable = true},

  rainbow = {enable = true},

  context_commentstring = {
      enable_autocmd = false,
      enable = true,
      config = {
          javascript = {__default = '// %s', jsx_element = '{/* %s */}', jsx_fragment = '{/* %s */}', jsx_attribute = '// %s', comment = '// %s'},
          svelte = '<!-- %s -->'
      }
  },

  tree_docs = {enable = true},

  autotag = {
    enable = true,
    filetypes = {'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'rescript'}
  }
}
