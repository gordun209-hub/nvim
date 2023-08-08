M = {}

local opts = { noremap = true, silent = true } -- i don't want to have to write these after every keymap
local term_opts = { silent = true } -- same for the terminal keybindings

local keymap = vim.api.nvim_set_keymap -- make it easier to set these things

keymap('n', '<Space>', '', opts) -- I don't remember why this is useful but I'm not deleting it


-- better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- move through buffers easily, better with tabline on or with bufferline installed
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Press jk fast to exit insert mode 
-- keymap("i", "jk", "<ESC>", opts)
-- keymap("i", "kj", "<ESC>", opts)



-- allows us to move selected blocks of text, with proper indenting
-- from Mr. The Primeagen
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- make sure you use a capital 'J' for this first one, or it won't work
keymap("n", "J", "mzJ`z", opts)
keymap("n", "<C-d>", "<C-d>zz", opts) -- keep cursor in middle of screen when i move down
keymap("n", "<C-u>", "<C-u>zz", opts) -- keep cursor in middle of screen when i move up


-- tmux navigator mappings.
vim.g.tmux_navigator_no_mappings = 1

keymap('n', '<C-h>', ':<C-U>TmuxNavigateLeft<cr>', opts)
keymap('n', '<C-j>', ':<C-U>TmuxNavigateDown<cr>', opts)
keymap('n', '<C-k>', ':<C-U>TmuxNavigateUp<cr>', opts)
keymap('n', '<C-l>', ':<C-U>TmuxNavigateRight<cr>', opts)

return M
