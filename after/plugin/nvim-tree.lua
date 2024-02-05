
-- Taken from online repo 

-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set("n", "<leader>nf", vim.cmd.NvimTreeFocus);
vim.keymap.set("n", "<leader>nc", vim.cmd.NvimTreeClose);
vim.keymap.set("n", "<leader>na", vim.cmd.NvimTreeFindFile);
