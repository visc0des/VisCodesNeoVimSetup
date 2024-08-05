
-- Creating table for markdown preview plugin
return {

    -- Importing the plugin
    "iamcco/markdown-preview.nvim",
    
    -- Defining the run attribute
    run = function()
        vim.fn["mkdp#util#install"]()
    end,

    -- Defining setup function
    setup = function()
        vim.g.mkdp_filetypes = { "markdown", }
    end,

    -- Defining an ft attribute
    ft = { "markdown", },


}
