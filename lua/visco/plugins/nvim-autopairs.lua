
-- Return table for autopairing bracket closers
return {

    -- Importing the plugin
    "windwp/nvim-autopairs",

    -- Setting configurations
    config = function()
        require("nvim-autopairs").setup()
    end,

}
