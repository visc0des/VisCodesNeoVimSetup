
-- The plugin table for the LSPs I will be using
return {

    -- Installing the plugin, specifying brach
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v3.x',

    -- Installing the many dependencies
    dependencies = {
        
        -- LSP Support
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        {'WhoIsSethDaniel/mason-tool-installer.nvim'},
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

    },

    -- Doing the insane setup lol
    config = function()

        -- 1. Configurations for the General LSP
        -- 2. Configurations for the Python LSP
        -- 3. Configurations for the Java LSP
        -- 4. Configurations for the Latex LSP
        -- 5. Configurations for the Mason plugin
        -- 6. Configurations for the cmp plugin

        ----------------- Configurations for the general LSP ----------------- 

        local lsp_zero = require('lsp-zero')
        lsp_zero.on_attach(function(client, bufnr)
          local opts = {buffer = bufnr, remap = false}
          vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
          vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
          vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
          vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
          vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
          vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
          vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
          vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
          vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
          vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end)

        --------------------------------------------------------------
        


        -- Setting up the lsp configurations
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
        local lspconfig = require("lspconfig");



        ----------- Python LSP Configuration ----------- 
        
        lspconfig.pylsp.setup({
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            ignore = {'E703', 'E303', 'E302', 'W291', 'W293', 'E261', 'W391', 'E251', 'E251'}, 
                            maxLineLength = 120,
                        },
                    },
                },
            },
            capabilities = capabilities,
            filetypes = {"python"},
        })

        ------------------------------------------------



        ----------- Java LSP Configuration ----------- 
        
        lspconfig.jdtls.setup({
            cmd = {
                "C:/Users/visco/AppData/Local/nvim-data/mason/bin/jdtls.cmd"
            }
        });

        ----------------------------------------------




        ----------- Latex LSP Configuration ----------- 

        lspconfig.ltex.setup({
            on_attach = on_attach,
            settings = {
                ltex = {
                    language = "en",
                },
            },
            filetypes = { "tex" },
            flags = { debounce_text_changes = 300 },
        })

        -----------------------------------------------



        ------------------------- Configurations for Mason ------------------------- 

        -- to learn how to use mason.nvim with lsp-zero
        -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
        require('mason').setup({})
        require('mason-lspconfig').setup({
          ensure_installed = {
              'pylsp'
          },
          handlers = {
            lsp_zero.default_setup,
            lua_ls = function()
              local lua_opts = lsp_zero.nvim_lua_ls()
              require('lspconfig').lua_ls.setup(lua_opts)
            end,
          }
        })

        -- Mason tool installer here: For the linter, formatter, and debugger plugins for LSP servers above. --
        require ('mason-tool-installer').setup({

            ensure_installed = {
                -- For pylsp (probably not all of them getting used, but will keep them all for now). 
                'black',
                'debugpy',
                'flake8',
                'isort',
                'mypy',
                'pylint',
                'ruff'
            }
        })

        ----------------------------------------------------------------------------




        ---------------------------- Configurations for cmp plugin ---------------------------- 

        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}

        cmp.setup({
          sources = {
            {name = 'path'},
            {name = 'nvim_lsp'},
            {name = 'nvim_lua'},
            {name = 'luasnip', keyword_length = 2},
            {name = 'buffer', keyword_length = 3},
          },
          formatting = lsp_zero.cmp_format(),
          mapping = cmp.mapping.preset.insert({
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ['<C-Space>'] = cmp.mapping.complete(),                 -- triggers completion menu
          }),
        })

        ---------------------------------------------------------------------------------------

    end

}
