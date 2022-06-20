-- return {formatCommand = './node_modules/.bin/prettier --find-config-path --stdin-filepath ${INPUT}', formatStdin = true}
return {
    formatCommand = 'prettier_d_slim "${INPUT}" --parser html',
    formatStdin = true,
    env = {
        string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand('~/.config/nvim/utils/linter-config/.prettierrc.json')),
    },
}
