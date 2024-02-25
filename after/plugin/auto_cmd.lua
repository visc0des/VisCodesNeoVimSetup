
-- This calls certain commands automatically depending on file types.

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.md", "*.txt", "*.tex"},
    command = "PencilSoft",
})
