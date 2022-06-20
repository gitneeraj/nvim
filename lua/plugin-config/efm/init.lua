local lsp_config = require('lspconfig')
local on_attach = require('plugin-config.efm.on_attach')
local eslint = require('plugin-config.efm.eslint')
local prettier = require('plugin-config.efm.prettier')
local html_prettier = require('plugin-config.efm.html-prettier')
local luaformat = require('plugin-config.efm.lua-formatter')

local format_on_save = function()
    -- On Pre Buffer
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
end

vim.lsp.handlers["textDocument/formatting"] = format_on_save

local efm_root_markers = {
    'package.json', '.git/', '.zshrc', ".lua-format", ".eslintrc.cjs", ".eslintrc", ".eslintrc.json", ".eslintrc.js",
    ".prettierrc", ".prettierrc.js", ".prettierrc.json", ".prettierrc.yml", ".prettierrc.yaml", ".prettier.config.js",
    ".prettier.config.cjs"
}
local efm_languages = {
    yaml = {prettier},
    json = {prettier},
    markdown = {prettier},
    javascript = {eslint, prettier},
    javascriptreact = {eslint, prettier},
    ["javascript.jsx"] = {eslint, prettier},
    typescript = {eslint, prettier},
    typescriptreact = {eslint, prettier},
    ["typescript.tsx"] = {eslint, prettier},
    css = {prettier},
    scss = {prettier},
    sass = {prettier},
    less = {prettier},
    graphql = {prettier},
    vue = {prettier},
    html = {prettier},
    svelte = {eslint, prettier},
    lua = {luaformat}
}

return {
    filetypes = {
        'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'svelte',
        'lua', 'json', 'css', 'scss', 'sass', 'less'
    },
    on_attach = on_attach,
    root_dir = lsp_config.util.root_pattern(unpack(efm_root_markers)),

    -- Set some extra settings
    init_options = {
        -- Enable document formatting
        documentFormatting = true,

        -- Enable hover information functionality
        hover = true,

        -- Enable the use of symbols
        documentSymbol = true,

        -- Enable the use of code actions
        codeAction = true,

        -- Enable autocompletion popup
        completion = true
    },
    settings = {log_file = '~/.config/nvim/efm.log', rootMarkers = efm_root_markers, languages = efm_languages}
}
