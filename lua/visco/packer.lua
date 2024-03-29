-- [[ COPIED CODE FROM PACKER REPO ]]

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'


	-- [[ Include my packet statements below here ]]

	-- For telescope.nvim 
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}


	-- For color plugin
	use ({"folke/tokyonight.nvim", as = "tokyonight", config = function() vim.cmd('colorscheme tokyonight-night') end})

	-- Plugin for treesitter
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	-- use('nvim-treesitter/playground')

	-- Plugin for harpoon (made by primeagen)
	use('theprimeagen/harpoon')

	-- Installing lsp config
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {

			--- Uncomment the two plugins below if you want to manage the language servers from neovim

			-- LSP Support
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'neovim/nvim-lspconfig'},
            {"nvimtools/none-ls.nvim"}, -- replaces null-ls, 

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-nvim-lua'},
			{'saadparwaiz1/cmp_luasnip'},
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},

            -- For spell checking in latex 
            {"valentjn/ltex-ls"},
		}
	}
    -- For tool installers
    use 'WhoIsSethDaniel/mason-tool-installer.nvim'

	-- For Tmux
	use({
		"aserowy/tmux.nvim",
		config = function() return require("tmux").setup() end
	})


	-- For Obsidian
	use({
		"epwalsh/obsidian.nvim",
		tag = "*",  -- recommended, use latest release instead of latest commit
		requires = {
			-- Required.
			"nvim-lua/plenary.nvim",

		},
		config = function()
			require("obsidian").setup({
				workspaces = {
					{
						name = "Main Vault - LV",
						path = "",
					},
				},

			})
		end,
	})
	use "nvim-lua/plenary.nvim"


    -- For an integrated terminal 
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    -- For bracket closer 
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    -- For git-fugitive
    use "tpope/vim-fugitive"

    -- For markdown preview 
    use({
	    "iamcco/markdown-preview.nvim",
	    run = function() vim.fn["mkdp#util#install"]() end,
    })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    -- For twilight and zen mode 
    use "folke/twilight.nvim"
    use "folke/zen-mode.nvim"

    -- For pencil
    use "preservim/vim-pencil"

    -- For file tree 
    use "nvim-tree/nvim-tree.lua"
    use "nvim-tree/nvim-web-devicons"

    -- For markdown syntaxc
    use "tpope/vim-markdown"

    -- For vim surround 
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    -- For vim easy motion
    use "easymotion/vim-easymotion"

    -- For lua line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    
    -- For LaTeX in Vim 
    use 'lervag/vimtex'


    
end)
