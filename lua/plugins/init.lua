return {

  { 'nvim-lua/plenary.nvim' },

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
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
    event = 'VeryLazy',
    opts = {
      options = {
        component_separators = '',
        section_separators = '',
        icons_enabled = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_z = { 'location' },
      },
    },
  },
  { 'HiPhish/nvim-ts-rainbow2' },
}
