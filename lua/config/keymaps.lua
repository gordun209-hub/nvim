local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-i>", "<C-i>", opts)

-- Better window navigation
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

-- vim.keymap.set({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
-- vim.keymap.set({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
-- vim.keymap.set({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
-- vim.keymap.set({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")
-- vim.keymap.set({ "n", "t" }, "<C-p>", "<CMD>NavigatorPrevious<CR>")
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])
keymap("n", "x", '"_x')



-- more good
-- keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
-- keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)


-- Move selected lines down with Shift+J
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

-- Move selected lines up with Shift+K
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set({ "n", "i" }, "<C-s>", function()
    vim.cmd("w")
end, { noremap = true, silent = true, desc = "Save buffer" })

vim.api.nvim_set_keymap("t", "<C-;>", "<C-\\><C-n>", opts)
