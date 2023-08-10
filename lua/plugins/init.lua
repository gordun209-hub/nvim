return { {
  "nvim-tree/nvim-web-devicons",
  opts = {},
  lazy = true
},
  { "nvim-lua/plenary.nvim" },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = {
        win_options = {
          winblend = 0,
        },
      },
      select = {
        win_options = {
          winblend = 0,
        },
        nui = {
          win_options = {
            winblend = 0,
          },
        },
      },
    },
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
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        component_separators = "",
        section_separators = "",
        icons_enabled = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = { "filetype" },
        lualine_z = { "location" },
      },
      extensions = { "nvim-tree" },
    },
  },
  { "HiPhish/nvim-ts-rainbow2" },
}
