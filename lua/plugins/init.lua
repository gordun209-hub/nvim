return {

  { 'nvim-lua/plenary.nvim' },
  {
    'echasnovski/mini.basics',
    version = false,
    config = function()
      require('mini.basics').setup({
        options = {
          basic = true,
          extra_ui = true,
          win_borders = 'double',
        },
        mappings = {
          basic = true,
          windows = true,
          move_with_alt = false,
        },

        -- Autocommands. Set to `false` to disable
        autocommands = {
          basic = true,
          relnum_in_visual_mode = false,
        },
        silent = false,
      })
    end,
  },

  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    keys = {
      { '<Leader>u', '<cmd>UndotreeToggle<CR>', desc = 'Undo Tree' },
    },
  },

  {
    'saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
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
  {
    'lervag/vimtex',
    lazy = false,
    ft = { 'tex', 'markdown' },
    config = function()
      vim.cmd([[filetype plugin indent on]])
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_syntaxs_enabled = 0
      vim.opt.conceallevel = 2
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_compiler_latexmk = {
        options = {
          '-shell-escape',
          '-verbose',
          '-file-line-error',
          '-synctex=1',
          '-interaction=nonstopmode',
        },
      }
    end,
  },

  -- highlights
  {
    'RRethy/vim-illuminate',
    config = function()
      require('illuminate').configure({
        providers = {
          'lsp',
          'treesitter',
        },
        delay = 100,
        under_cursor = true,
        min_count_to_highlight = 2,
      })
    end,
  },
  {
    'ahmedkhalf/project.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>pj',
        function()
          require('telescope').extensions.projects.projects()
        end,
        { desc = 'Browse projects' },
      },
    },

    config = function()
      require('project_nvim').setup({
        -- Manual mode doesn't automatically change your root directory, so you have
        -- the option to manually do so using `:ProjectRoot` command.
        manual_mode = false,

        -- Methods of detecting the root directory. **"lsp"** uses the native neovim
        -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
        -- order matters: if one is not detected, the other is used as fallback. You
        -- can also delete or rearangne the detection methods.
        detection_methods = { 'pattern', 'lsp' },

        -- All the patterns used to detect root dir, when **"pattern"** is in
        -- detection_methods
        patterns = { '.git', '.vscode', '.svn', 'Makefile', 'package.json' },

        -- Table of lsp clients to ignore by name
        -- eg: { "efm", ... }
        ignore_lsp = {},

        -- Don't calculate root dir on specific directories
        -- Ex: { "~/.cargo/*", ... }
        exclude_dirs = {},

        -- Show hidden files in telescope
        show_hidden = false,

        -- When set to false, you will get a message when project.nvim changes your
        -- directory.
        silent_chdir = true,

        -- What scope to change the directory, valid options are
        -- * global (default)
        -- * tab
        -- * win
        scope_chdir = 'global',

        -- Path where project.nvim will store the project history for use in
        -- telescope
        datapath = vim.fn.stdpath('data'),
      })
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    ft = 'markdown',
  },
}
