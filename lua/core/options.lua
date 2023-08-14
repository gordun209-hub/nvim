vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local opt = vim.opt
local g = vim.g
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
opt.clipboard = 'unnamedplus' -- Sync with system clipboard
opt.expandtab = true -- Use spaces instead of tabs
opt.grepprg = 'rg --vimgrep'
opt.ignorecase = true -- Ignore case
opt.scrolloff = 8 -- Lines of context
opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize' }
opt.shiftwidth = 2 -- Size of an indent
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.updatetime = 50
opt.colorcolumn = '120'
opt.wildmenu = true
opt.wildmode = 'longest:full,full' -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.redrawtime = 101
opt.cursorline = false
opt.shortmess:append('Ic')
opt.relativenumber = true
opt.wrap = false
opt.hlsearch = false
opt.nu = true
opt.wildignorecase = true
opt.cmdheight = 0
opt.cmdwinheight = 5
opt.equalalways = false
opt.display = 'lastline'
opt.hidden = true
opt.pumblend = 10
opt.winblend = 10

g.markdown_recommended_style = 0
g.python3_host_prog = '/usr/bin/python3'
g.loaded_python_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0

local fences = {
  'go',
  'javascript',
  'js=javascript',
  'json',
  'lua',
  'python',
  'sh',
  'shell=sh',
  'ts=typescript',
  'typescript',
}
vim.g.markdown_fenced_languages = fences

vim.cmd([[highlight Comment cterm=italic term=italic gui=italic]])
vim.cmd([[highlight htmlArg cterm=italic term=italic gui=italic]])
vim.cmd([[highlight xmlAttrib cterm=italic term=italic gui=italic]])
vim.cmd([[highlight Normal ctermbg=none]])
