local function builtin() return require('telescope.builtin') end
return {
  {

    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    keys = {

      { '<leader>fw', function() builtin().grep_string() end,    desc = "Word" },
      { '<leader>ff', function() builtin().find_files() end,     desc = "Telescope Find Files" },
      { '<leader>/',  function() builtin().live_grep() end,      desc = "Telescope Live Grep" },
      { '<leader>fb', function() builtin().buffers() end,        desc = "Telescope Buffers" },
      { '<leader>fh', function() builtin().help_tags() end,      desc = "Telescope Help Tags" },
      { '<leader>fk', function() builtin().keymaps() end,        desc = "Telescope Show Keymaps" },
      { '<leader>fr', function() builtin().lsp_references() end, desc = "Telescope Lsp References" },
    },
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
    },

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

}
