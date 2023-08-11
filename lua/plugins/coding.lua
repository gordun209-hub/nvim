local icons = {
  git = ' ',
  diagnostics = {
    Error = '✘', --   ✘
    Warn = '󰀪', -- 󰀪 󰳤 󱦄 󱗓 
    Info = 'ⁱ', --    ⁱ 󰋼 󰋽
    Hint = '', --  󰌶 
  },
  status = {
    git = {
      added = '₊', --  ₊
      modified = '∗', --  ∗
      removed = '₋', --  ₋
    },
    diagnostics = {
      error = ' ',
      warn = ' ',
      info = ' ',
      hint = '󰌶 ',
    },
    filename = {
      modified = '+',
      readonly = '🔒',
      zoomed = '🔎',
    },
  },
  -- Default completion kind symbols.
  kinds = {
    Array = '󰅪 ', --  󰅪 󰅨 󱃶
    Boolean = '◩ ', --  ◩ 󰔡 󱃙 󰟡 󰨙
    Class = '󰌗 ', --  󰌗 󰠱 𝓒
    Color = '󰏘 ', -- 󰸌 󰏘
    Constant = '󰏿 ', --   󰏿
    Constructor = '󰆧 ', --  󰆧   
    Copilot = ' ', -- 
    Enum = '󰕘 ', --  󰕘  ℰ 
    EnumMember = ' ', --  
    Event = ' ', --  
    Field = ' ', -- 󰄶  󰆨  󰀻 󰃒
    File = ' ', --    󰈔 󰈙
    Folder = ' ', --   󰉋
    Function = '󰊕 ', --  󰊕 
    Interface = ' ', --    
    Key = ' ', -- 
    Keyword = ' ', --   󰌋 
    Method = '󰆧 ', --  󰆧 ƒ
    Module = ' ', --   󰅩 󰆧 󰏗
    Namespace = ' ', --   󰅩
    Null = ' ', --  󰟢
    Number = '󰎠 ', --  󰎠 
    Object = ' ', --   󰅩
    Operator = '󰃬 ', --  󰃬 󰆕 +
    Package = ' ', --   󰏖 󰏗
    Property = '󰖷 ', --  󰜢  
    Reference = '󰈝 ', --  󰈝 󰈇
    Snippet = ' ', --  󰘌 ⮡   
    String = '󰅳 ', --  󰅳
    Struct = ' ', --   𝓢 󰙅 󱏒
    Text = ' ', --   󰉿 𝓐
    TypeParameter = ' ', --  󰊄 𝙏
    Unit = ' ', --   󰑭 
    Value = ' ', --   󰀬 󰎠
    Variable = ' ', --   󰀫 
  },
}

return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      { 'saadparwaiz1/cmp_luasnip', dependencies = 'L3MON4D3/LuaSnip' },
      'andersevenrud/cmp-tmux',
    },
    opts = function()
      local cmp = require('cmp')
      local defaults = require("cmp.config.default")()
      local luasnip = require('luasnip')

      local function has_words_before()
        if vim.bo.buftype == 'prompt' then
          return false
        end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        -- stylua: ignore
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
      end

      return {
        preselect = cmp.PreselectMode.None,
        sorting = defaults.sorting,
        experimental = {
          ghost_text = {
            hl_group = 'LspCodeLens',
          },
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp', priority = 50 },
          { name = 'path',     priority = 40 },
          { name = 'luasnip',  priority = 30 },
        }, {
          { name = 'buffer', priority = 50, keyword_length = 3 },
          { name = 'emoji',  insert = true, priority = 20 },
          {
            name = 'tmux',
            priority = 10,
            keyword_length = 3,
            option = { all_panes = true, label = 'tmux' },
          },
        }),
        mapping = cmp.mapping.preset.insert({
          -- <CR> accepts currently selected item.
          -- Set `select` to `false` to only confirm explicitly selected items.
          ['<CR>'] = cmp.mapping({
            i = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ select = false })
              else
                fallback()
              end
            end,
            s = cmp.mapping.confirm({
              select = true,
              behavior = cmp.ConfirmBehavior.Replace,
            }),
            -- Do not set command mode, it will interfere with noice popmenu.
          }),
          ['<S-CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-d>'] = cmp.mapping.select_next_item({ count = 5 }),
          ['<C-u>'] = cmp.mapping.select_prev_item({ count = 5 }),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-c>'] = function(fallback)
            cmp.close()
            fallback()
          end,
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.jumpable(1) then
              luasnip.jump(1)
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        formatting = {
          format = function(entry, vim_item)
            -- Prepend with a fancy icon from config lua/rafi/config/init.lua
            if entry.source.name == 'git' then
              vim_item.kind = icons.git
            else
              local symbol = icons.kinds[vim_item.kind]
              if symbol ~= nil then
                vim_item.kind = symbol .. ' ' .. vim_item.kind
              end
            end
            return vim_item
          end,
        },
      }
    end,
  },

  -----------------------------------------------------------------------------
  {
    'L3MON4D3/LuaSnip',
    event = 'InsertEnter',
    dependencies = { 'rafamadriz/friendly-snippets' },
    build = (not jit.os:find('Windows'))
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
        or nil,
    -- stylua: ignore
    keys = {
      {
        '<C-l>',
        function() require('luasnip').expand_or_jump() end,
        mode = { 'i', 's' },
      },
    },
    opts = {
      -- Don't store snippet history for less overhead
      history = false,
      -- Event on which to check for exiting a snippet's region
      region_check_events = 'InsertEnter',
      delete_check_events = 'InsertLeave',
      ft_func = function()
        return vim.split(vim.bo.filetype, '.', { plain = true })
      end,
    },
    config = function(_, opts)
      require('luasnip').setup(opts)
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    lazy = true,

    config = function()
      local npairs = require("nvim-autopairs")
      npairs.setup({
        check_ts = true,
        fast_wrap = {
          map = "<A-w>",
          chars = { "{", "[", "(", '"', "'" },
          pattern = [=[[%'%"%)%>%]%)%}%,]]=],
          end_key = "-",
          keys = "htnsdaoeuigcrlf',.pybmwvz;",
          check_comma = true,
          highlight = "Search",
          highlight_grey = "Comment",
        },
        enable_check_bracket_line = false,
      })
      npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }
}
