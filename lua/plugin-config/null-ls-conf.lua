local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local codeActions = null_ls.builtins.code_actions

local sources = {
  formatting.eslint_d, formatting.prettierd.with({
    env = {
      PRETTIERD_DEFAULT_CONFIG = vim.fn.expand "~/.config/nvim/utils/linter-config/.prettierrc.js"
    }
  }), -- formatting.prettier
  --     .with({extra_args = {'--single-quote', '--tab-width 2', '--arrow-parens avoid'}}),
  formatting.lua_format.with({
    extra_args = {
      '--no-keep-simple-function-one-line', '--no-break-after-operator', '--column-limit=100',
      '--break-after-table-lb', '--indent-width=2'
    }
  }), diagnostics.eslint_d.with({diagnostics_format = "[#{c}] #{m} (#{s})"}), codeActions.eslint_d
}

null_ls.setup({
  sources = sources,
  debug = true,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()")
    end
  end
})
