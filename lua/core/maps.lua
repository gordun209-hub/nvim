local silent = { silent = true, noremap = true }

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", silent)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", silent)

vim.keymap.set('n', 'J', 'mzJ`z', silent)

-- vim.keymap.set('n', '<C-d>', '<C-d>zz', silent)
-- vim.keymap.set('n', '<C-u>', '<C-u>zz', silent)

vim.keymap.set('n', 'n', 'nzzzv', silent)
vim.keymap.set('n', 'N', 'Nzzzv', silent)

-- telescope mappings
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', silent)
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', silent)
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', silent)
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', silent)
vim.keymap.set('n', '<leader>ft', '<cmd>Telescope treesitter<cr>', silent)
vim.keymap.set('n', '<leader>fm', '<cmd>Telescope marks<cr>', silent)
vim.keymap.set('n', '<leader>fq', '<cmd>Telescope quickfix<cr>', silent)
vim.keymap.set('n', '<leader>fl', '<cmd>Telescope loclist<cr>', silent)
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope colorscheme<cr>', silent)
vim.keymap.set('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', silent)
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope registers<cr>', silent)
vim.keymap.set('n', '<leader>fv', '<cmd>Telescope vim_options<cr>', silent)
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope spell_suggest<cr>', silent)
