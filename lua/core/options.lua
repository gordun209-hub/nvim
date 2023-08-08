-- Set shell
-- https://github.com/neovim/nvim-lspconfig/issues/2713
vim.o.shell = "/bin/bash"

-- Incremental live completion
vim.o.inccommand = "nosplit"

-- Enable highlight on search
vim.o.hlsearch = true

-- Do not save when switching buffers
vim.o.hidden = true
-- Show relative line numbers in the sidebar
vim.opt.relativenumber = true
-- Use swapfiles
vim.o.swapfile = true

-- Save undo history
vim.o.undolevels = 1000

-- Decrease update time
vim.o.updatetime = 250

-- Decrease redraw time
vim.o.redrawtime = 100

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>hl")

-- set symbols for space and newline
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")


-- Number of command-lines that are remembered
vim.o.history = 10000

-- Use menu for command line completion
vim.o.wildmenu = true

-- Command-line completion mode
vim.opt.wildmode = "longest:full,full"

-- Ignore case when completing file names and directories.
vim.o.wildignorecase = true

-- Enable wrap
vim.o.wrap = true

-- Autom. read file when changed outside of Vim
vim.o.autoread = true

-- Autom. save file before some action
vim.o.autowrite = true

-- Briefly jump to matching bracket if insert one
vim.o.showmatch = true


-- Make builtin completion menus slightly transparent
vim.o.pumblend = 10

-- Maximum height of the popup menu
vim.o.pumheight = 15

-- Show cmdline by default
vim.o.cmdheight = 1

-- Minimum nr. of lines above and below cursor
vim.o.scrolloff = 5 -- could be 1
vim.o.sidescrolloff = 5

-- Timeout on leaderkey
vim.o.ttimeout = true
vim.o.ttimeoutlen = 5

-- Timeout on mapped sequences
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Show (partial) command in status line
vim.o.showcmd = false

-- Configure the number of spaces a tab is counting for
vim.o.tabstop = 2

-- Number of spaces for a step of indent
vim.o.shiftwidth = 2

-- Round indent to multiple of shiftwidth
vim.o.shiftround = true

-- Use smart indenting
vim.o.smartindent = true

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- Folding
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = "0"

-- Use ripgrep as grep tool
vim.o.grepprg = "rg --vimgrep --no-heading"
vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"

-- Under evaluation
vim.opt.formatoptions = "jcroqlnt" -- tcqj
vim.opt.splitkeep = "screen"
vim.opt.shortmess:append({ C = true })

-- No double spaces with join after a dot
vim.opt.joinspaces = false

-- Set directories for backup/swap/undo files
vim.opt.directory = vim.fn.stdpath("state") .. "/swap"
vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"

-- Set python3 interpreter
vim.g.python3_host_prog = "/usr/bin/python3"

-- Disable some builtin providers
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- Do not load system vimfiles
vim.api.nvim_command("set rtp-=/usr/share/vim/vimfiles")

local fences = {
	"go",
	"javascript",
	"js=javascript",
	"json",
	"lua",
	"python",
	"sh",
	"shell=sh",
	"ts=typescript",
	"typescript",
}
vim.g.markdown_fenced_languages = fences
