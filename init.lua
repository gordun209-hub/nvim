require("paq")({
    "savq/paq-nvim", -- Let Paq manage itself
    "nvim-lua/plenary.nvim",
    -- Colortheme
    { "catppuccin/nvim",                  as = "catppuccin" },
    -- Syntax
    {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            vim.cmd([[:TSUpdateSync]])
        end,
    },
    { 'VonHeikemen/lsp-zero.nvim',
    },

    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },

    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },

    { 'nvim-telescope/telescope.nvim',    tag = '0.1.0' },
})
require("core.options")
require("core.maps")
-- Colorscheme
