return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'kevinhwang91/nvim-ufo',
    },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { 'c', 'latex', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim' },

        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = false,
        incremental_selection = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        highlight = { enable = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },
        rainbow = { enable = true },
        require('ufo').setup({
          provider_selector = function(bufnr, filetype, buftype)
            return { 'treesitter', 'indent' }
          end,
        }),
      })
    end,
  },
  { 'chrisbra/csv.vim', ft = 'csv' },
  { 'tmux-plugins/vim-tmux', ft = 'tmux' },
  { 'HiPhish/nvim-ts-rainbow2', event = 'VeryLazy' },
  {
    'mboughaba/i3config.vim',
    ft = 'i3config',
  },
}
