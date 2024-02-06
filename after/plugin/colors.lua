
require("tokyonight").setup({

    style = "night",
    transparent = true,
    styles = {
        sidebars = "transparent",
        floats = "transparent",
    },
    dim_inactive = true,
    lualine_bold = true,

})

function ColorMyPencils(color)

	-- Default the color scheme
	color = color or "tokyonight-night"
	vim.cmd.colorscheme(color)

	-- Making background transparent
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end


ColorMyPencils()
