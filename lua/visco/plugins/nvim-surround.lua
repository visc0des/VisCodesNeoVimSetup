
-- Plugin table for neovim surround plugin
return {

    -- Importing the plugin
    "kylechui/nvim-surround",

    -- Setting up the plugin
    config = function()
        require("nvim-surround").setup()
    end

}
