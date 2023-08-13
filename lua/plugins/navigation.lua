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
    'nvim-telescope/telescope-file-browser.nvim',
    lazy = false,
    config = function()
      require('telescope').load_extension('file_browser')
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    cmd = { 'TmuxNavigateLeft', 'TmuxNavigateDown', 'TmuxNavigateUp', 'TmuxNavigateRight' },
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
    event = 'VeryLazy',

    config = function()
      require('fm-nvim').setup({})
    end,
  },
  {
    'ibhagwan/fzf-lua',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      {
        '<leader>/c',
        function()
          require('fzf-lua').commands()
        end,
        desc = 'Search commands',
      },
      {
        '<leader>/C',
        function()
          require('fzf-lua').command_history()
        end,
        desc = 'Search command history',
      },
      {
        '<leader>/f',
        function()
          require('fzf-lua').files()
        end,
        desc = 'Find files',
      },
      {
        '<leader>/o',
        function()
          require('fzf-lua').oldfiles()
        end,
        desc = 'Find files',
      },
      {
        '<leader>/h',
        function()
          require('fzf-lua').highlights()
        end,
        desc = 'Search highlights',
      },
      {
        '<leader>/M',
        function()
          require('fzf-lua').marks()
        end,
        desc = 'Search marks',
      },
      {
        '<leader>/k',
        function()
          require('fzf-lua').keymaps()
        end,
        desc = 'Search keymaps',
      },
      {
        '<leader>/t',
        function()
          require('fzf-lua').treesitter()
        end,
        desc = 'Search treesitter',
      },
      {
        '<leader>/gf',
        function()
          require('fzf-lua').git_files()
        end,
        desc = 'Find git files',
      },
      {
        '<leader>/gb',
        function()
          require('fzf-lua').git_branches()
        end,
        desc = 'Search git branches',
      },
      {
        '<leader>/gc',
        function()
          require('fzf-lua').git_commits()
        end,
        desc = 'Search git commits',
      },
      {
        '<leader>/gC',
        function()
          require('fzf-lua').git_bcommits()
        end,
        desc = 'Search git buffer commits',
      },
      {
        '<leader>bc',
        function()
          require('fzf-lua').git_bcommits()
        end,
        desc = 'Search git buffer commits',
      },
      {
        '<leader>//',
        function()
          require('fzf-lua').resume()
        end,
        desc = 'Resume FZF',
      },
    },
    config = function()
      local fzf = require('fzf-lua')
      fzf.setup({
        keymap = {
          fzf = {
            ['CTRL-Q'] = 'select-all+accept',
          },
        },
      })
      fzf.register_ui_select()
    end,
  },
}
