return {

  {
    'echasnovski/mini.statusline',
    event = 'VeryLazy',
    version = false,
    config = function()
      require('mini.statusline').setup()
    end,
  },
}
