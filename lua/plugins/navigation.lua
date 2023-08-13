return {
  {

    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    tag = '0.1.2',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('telescope').setup({
        defaults = {
          -- ignore some files when grep
          file_ignore_patterns = {
            'node_modules',
            'dist',
            'build',
            'target',
            'LICENSE',
            'vendor',
            'Pods',
            'Carthage',
            '.*.png',
          },
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--trim', -- add this value
          },

          layout_strategy = 'flex',
          layout_config = {
            width = 0.95,
            height = 0.85,
            prompt_position = 'top',
            horizontal = {
              width = { padding = 0.15 },
              preview_width = 0.6,
            },
            vertical = {
              width = { padding = 0.3 },
              preview_height = 0.75,
            },
          },
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },

          file_sorter = require('telescope.sorters').get_fzy_sorter,
        },
      })
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    -- stylua: ignore
    keys = {
      { '<C-h>', '<cmd>TmuxNavigateLeft<CR>',  mode = { 'n', 't' }, silent = true, desc = 'Jump to left pane' },
      { '<C-j>', '<cmd>TmuxNavigateDown<CR>',  mode = { 'n', 't' }, silent = true, desc = 'Jump to lower pane' },
      { '<C-k>', '<cmd>TmuxNavigateUp<CR>',    mode = { 'n', 't' }, silent = true, desc = 'Jump to upper pane' },
      { '<C-l>', '<cmd>TmuxNavigateRight<CR>', mode = { 'n', 't' }, silent = true, desc = 'Jump to right pane' },
    },
    init = function()
      vim.g.tmux_navigator_no_mappings = true
    end,
  },

  {
    'is0n/fm-nvim',
    config = function()
      require('fm-nvim').setup({})
    end,
  },
}
