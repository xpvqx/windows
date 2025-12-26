-- spacebar leader key
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- toggle nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- move focus between the tree and buffer
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Move to right window" })

-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
