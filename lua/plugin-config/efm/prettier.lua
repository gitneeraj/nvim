-- return {formatCommand = './node_modules/.bin/prettier --find-config-path --stdin-filepath ${INPUT}', formatStdin = true}
-- Below you can set some formatting options for prettier
-- Format options for prettier
local format_options_prettier = {
    tabWidth = 2,
    singleQuote = true,
    trailingComma = 'all',
    configPrecedence = 'prefer-file'
}

return {
    formatCommand = 'prettierd ${--config-precedence:configPrecedence} ${--tab-width:tabWidth} ${--single-quote:singleQuote} ${--trailing-comma:trailingComma} --stdin-filepath "${INPUT}"',
    formatStdin = true,
    env = {
        string.format('PRETTIERD_DEFAULT_CONFIG=%s',
                      vim.fn.expand('~/.config/nvim/utils/linter-config/.prettierrc.json'))
    }
}
