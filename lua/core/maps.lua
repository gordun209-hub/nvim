local silent = { silent = true, noremap = true }

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", silent)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", silent)

vim.keymap.set('n', 'J', 'mzJ`z', silent)

vim.keymap.set('n', '<C-d>', '<C-d>zz', silent)
vim.keymap.set('n', '<C-u>', '<C-u>zz', silent)

vim.keymap.set('n', 'n', 'nzzzv', silent)
vim.keymap.set('n', 'N', 'Nzzzv', silent)

-- Save buffer
vim.keymap.set('i', '<c-s>', '<esc><cmd>w<cr>a', silent)
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', silent)
