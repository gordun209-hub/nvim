vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local opt = vim.opt
vim.g.encoding = 'UTF-8'
opt.clipboard = 'unnamedplus' -- Sync with system clipboard
opt.completeopt = 'menu,menuone,noselect'
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.cursorline = false -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = 'jcroqlnt' -- tcqj
opt.grepformat = '%f:%l:%c:%m'
opt.hlsearch = false
opt.grepprg = 'rg --vimgrep'
opt.ignorecase = true -- Ignore case
opt.inccommand = 'nosplit' -- preview incremental substitute
opt.laststatus = 2
opt.list = false -- Show some invisible characters (tabs...
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 8 -- Lines of context
opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize' }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { 'en' }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.updatetime = 50
opt.colorcolumn = '80'
opt.wildmode = 'longest:full,full' -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.autoindent = true
vim.o.hidden = true
vim.o.redrawtime = 100
vim.o.wildignorecase = true
opt.splitkeep = 'screen'
opt.shortmess:append({ C = true })
vim.o.cmdheight = 0
vim.o.showcmd = false
vim.g.markdown_recommended_style = 0
-- Set directories for backup/swap/undo files
vim.opt.directory = vim.fn.stdpath('state') .. '/swap'
vim.opt.backupdir = vim.fn.stdpath('state') .. '/backup'
vim.opt.undodir = vim.fn.stdpath('state') .. '/undo'

-- Set python3 interpreter
vim.g.python3_host_prog = '/usr/bin/python3'

-- Disable some builtin providers
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.wrap = false

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
