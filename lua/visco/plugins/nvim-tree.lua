
-- Set up for the neovim tree plugin
return {
    
    -- Importing the plugin 
    "nvim-tree/nvim-tree.lua",

    -- Installing and loading dependencies (just like packer's "requires")
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    -- Making extra configurations
    config = function() 

        local ntree = require("nvim-tree");

        -- Recommended settings from nvim-tree docs (disabling netrw)
        vim.g.loaded_netrw = 1;
        vim.g.loaded_netrwPlugin = 1;

        -- Configuring settings
        ntree.setup({
            sort = { sorter = "case_sensitive", },
            view = { width = 30, },
            renderer = { group_empty = true, },
            filters = { dotfiles = true, },
        });

        -- Setting up shortcuts
        vim.keymap.set("n", "<leader>nf", vim.cmd.NvimTreeFocus);
        vim.keymap.set("n", "<leader>nc", vim.cmd.NvimTreeClose);
        vim.keymap.set("n", "<leader>na", vim.cmd.NvimTreeFindFile);

    end,
}
