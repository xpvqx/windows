-- spacebar leader key
vim.g.mapleader = " "

-- yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- toggle the tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- move focus between the tree and buffer
vim.api.nvim_set_keymap("n", "<A-h>", ":wincmd h<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-l>", ":wincmd l<CR>", { noremap = true, silent = true }) 
