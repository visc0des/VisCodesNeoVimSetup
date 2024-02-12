
-- [[ Custom editor settings set immediately ]]

-- Something that hopefully speeds up on Windows
vim.g.nofsync = true

-- Forcing line numbers 
vim.opt.nu = true 
vim.opt.relativenumber = true 

-- Forcing 4 space indents 
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Setting number width
vim.opt.numberwidth = 1

-- Disabling line wrapping
vim.opt.wrap = false

-- Setting search highlights to not highlight everything
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Setting good colors?
vim.opt.termguicolors = true

-- Making scrolling better
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Setting fast update time
 vim.opt.updatetime = 50

-- Setting a colour column 
vim.opt.colorcolumn = "120"

-- Global init of leader key 
vim.g.mapleader = " "

-- Setting fat cursor 
vim.opt.guicursor = "n-v-i-c:block-Cursor"
