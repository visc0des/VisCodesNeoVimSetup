
-- Plugin table for telescope plugin
return {

    -- Import the plugin
    "nvim-telescope/telescope.nvim",

    -- Importing the dependencies
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    -- Setting up configurations for short cuts
    config = function()

        local builtin = require('telescope.builtin')

        -- Custom remaps
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- For searching all files
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})	  -- For searching only git files
        vim.keymap.set('n', '<leader>ps', function () 
            builtin.grep_string({ search = vim.fn.input("Grep > ") }); 
        end)
        vim.keymap.set('n', '<leader>pb', builtin.buffers, {}) -- For searching all files

    end 

}
