local function builtin() return require('telescope.builtin') end
return {
  {

    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
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
      { '<leader>ff', function() builtin().find_files() end,     desc = "Telescope Find Files" },
      { '<leader>fg', function() builtin().live_grep() end,      desc = "Telescope Live Grep" },
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

  }, }
