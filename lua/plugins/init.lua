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
        manual_mode = false,
        detection_methods = { 'pattern', 'lsp' },
        patterns = { '.git', '.vscode', '.svn', 'Makefile', 'package.json' },
        ignore_lsp = {},
        exclude_dirs = {},
        show_hidden = false,
        silent_chdir = true,
        scope_chdir = 'global',
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
