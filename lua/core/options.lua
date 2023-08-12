vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local opt = vim.opt

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
opt.colorcolumn = '80'
opt.wildmenu = true
opt.wildmode = 'longest:full,full' -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
vim.o.redrawtime = 100
vim.opt.cursorline = false
vim.opt.shortmess:append('Ic')
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.nu = true
vim.o.wildignorecase = true
vim.o.cmdheight = 0
vim.opt.cmdwinheight = 5
vim.opt.equalalways = false
vim.opt.display = 'lastline'
vim.opt.pumblend = 10
vim.opt.winblend = 10
vim.g.markdown_recommended_style = 0
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

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
