
-- [[ CODE THAT WAS TAKEN FROM TELESCOPE REPO ]]

local builtin = require('telescope.builtin')

-- Custom remaps
vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- For searching all files
vim.keymap.set('n', '<C-p>', builtin.git_files, {})	  -- For searching only git files
vim.keymap.set('n', '<leader>ps', function () 
	builtin.grep_string({ search = vim.fn.input("Grep > ") }); 
end)




