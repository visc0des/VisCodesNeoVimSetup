
-- The plugin table for the none-ls plugin used for the LSPs (for python)
return {

    -- Importing the plugin
    "nvimtools/none-ls.nvim",

    -- Setting up the config
    config = function()

        local null_ls = require('null-ls') -- The package installed is actually none-ls.nvim

        null_ls.setup({
            sources = {
                null_ls.builtins.diagnostics.mypy.with({
                    command = "C:/Users/visco/AppData/Local/nvim-data/mason/bin/mypy.cmd",
                }),
            }
        })

    end
}
