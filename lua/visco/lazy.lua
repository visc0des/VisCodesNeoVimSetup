
-- [[Code here was taken from online documentation of lazy.nvim]]
--
-- Notes:
--      
--      1. {} are used to make tables. Tables serve as both arrays and dictionaries, depending on what it is used for. 
--
--      2. The "require" function loads and returns a module (a piece of code) from a file with the same name specified
--      in the arguments of the require function itself. 


--------- Bootstrapping lazy.nvim (the '..' is used for string concatenation) --------

-- Declaring the "lazy path" to get the lazy.nvim file (fn refers to the "function namespace" 
-- module of neovim which contains functions used internally by neovim. )
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- If the "unix vars" or "loop" utility functions do not exist in the lazy.nvim file...
if not (vim.uv or vim.loop).fs_stat(lazypath) then

    -- Cloning the lazy.nvim repo (vim.fn.system is a nvim function which executes a command and returns the output as a string)
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

    -- If the vim.fn.system function call had failed (shell error code does not equal 0), print the error msg
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            {"Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end

end

-- Prepending the lazypath directory with the "rtp" runtime path to specify other directories to search for plugins in
vim.opt.rtp:prepend(lazypath)

--------------------------------------------------------------------------------------



------------ Specifying the leader keys ------------ 

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

----------------------------------------------------



------------ Configuring other settings (i.e. in vim.opt ) ------------ 

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


-----------------------------------------------------------------------




--------------- Setting my custom keymaps (for quick plugins) --------------- 

-- For zen mode
vim.keymap.set("n", "<leader>zm", vim.cmd.ZenMode)

------------------------------------------------------



-------------- Setting up autocmds -------------- 

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.md", "*.txt", "*.tex"},
    command = "PencilSoft",
})

-------------------------------------------------



------------------------ Setting up lazy.nvim ------------------------ 

-- Loading up our plugins from the lazy module 
require("lazy").setup("visco.plugins")



----------------------------------------------------------------------
