
local null_ls = require('null-ls') -- The package installed is actually none-ls.nvim

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.mypy.with({
        }),
    }
})


