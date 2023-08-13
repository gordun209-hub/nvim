return {

  { 'nvim-lua/plenary.nvim' },
  {
    'echasnovski/mini.basics',
    version = false,
    config = function()
      require('mini.basics').setup({
        -- Options. Set to `false` to disable.
        options = {
          -- Basic options ('termguicolors', 'number', 'ignorecase', and many more)
          basic = true,

          -- Extra UI features ('winblend', 'cmdheight=0', ...)
          extra_ui = true,

          -- Presets for window borders ('single', 'double', ...)
          win_borders = 'double',
        },

        -- Mappings. Set to `false` to disable.
        mappings = {
          -- Basic mappings (better 'jk', save with Ctrl+S, ...)
          basic = true,

          -- Prefix for mappings that toggle common options ('wrap', 'spell', ...).
          -- Supply empty string to not create these mappings.
          option_toggle_prefix = [[\]],

          -- Window navigation with <C-hjkl>, resize with <C-arrow>
          windows = true,

          -- Move cursor in Insert, Command, and Terminal mode with <M-hjkl>
          move_with_alt = false,
        },

        -- Autocommands. Set to `false` to disable
        autocommands = {
          -- Basic autocommands (highlight on yank, start Insert in terminal, ...)
          basic = true,

          -- Set 'relativenumber' only in linewise and blockwise Visual mode
          relnum_in_visual_mode = false,
        },

        -- Whether to disable showing non-error feedback
        silent = false,
      })
    end,
  },
  {
    'echasnovski/mini.statusline',
    event = 'VeryLazy',
    version = false,
    config = function()
      require('mini.statusline').setup()
    end,
  },

  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    keys = {
      { '<Leader>gu', '<cmd>UndotreeToggle<CR>', desc = 'Undo Tree' },
    },
  },

  {
    'saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    opts = {},
  },
  { 'HiPhish/nvim-ts-rainbow2', event = 'VeryLazy' },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },

  {
    'karb94/neoscroll.nvim',
    keys = { { '<c-u>' }, { 'zz' }, { '<c-d>' }, { '<c-e>' }, { '<c-y>' } },
    opts = {},
  },
  -- Undo tree visualization
  {
    'mbbill/undotree',
    keys = {
      { '<leader>gu', '<cmd>UndotreeToggle<CR>', desc = 'Toggle undotree' },
    },
  },
}
