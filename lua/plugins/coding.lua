return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },
  -- auto completion
  {
    { -- https://github.com/hrsh7th/nvim-cmp -- 自动补全
      "hrsh7th/nvim-cmp",
      event = { "BufReadPost", "BufNewFile" },
      dependencies = {   -- cmp 源
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        {
          "saadparwaiz1/cmp_luasnip",
          dependencies = {
            "L3MON4D3/LuaSnip",
            dependencies = {
              "rafamadriz/friendly-snippets",
              "onsails/lspkind-nvim",
            }
          }
        },
      },
      config = function()
        local has_words_before = function()
          unpack = unpack or table.unpack
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          return col ~= 0 and
              vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end
        require("luasnip.loaders.from_vscode").lazy_load()
        local luasnip = require("luasnip")
        local cmp = require("cmp")
        cmp.setup({
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)           -- For 'luasnip' user
            end,
          },
          mapping = cmp.mapping.preset.insert({
            ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- they way you will only jump inside the snippet region
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif has_words_before() then
                cmp.complete()
              else
                fallback()
              end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),

            ['<CR>'] = cmp.mapping.confirm({ select = true }),
          }),
          sources = cmp.config.sources {
            { name = 'nvim_lsp' },
            { name = 'path' },
            { name = 'luasnip' },
            { name = 'buffer' },
          },
          formatting = {
            fields = { 'menu', 'abbr', 'kind' },
            format = require('lspkind').cmp_format({
              mode = 'symbol_text',           -- show only symbol annotations
              maxwidth = 60,
              before = function(entry, vim_item)
                local menu_icon = {
                  nvim_lsp = 'λ ',
                  luasnip = '⋗ ',
                  buffer = 'Ω ',
                  path = '🖫 ',
                }
                vim_item.menu = menu_icon[entry.source.name]
                return vim_item
              end,
            })
          },
          experimental = {
            ghost_text = true,
          },

        })
        require("cmp").setup.cmdline('/', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer' },
          }
        })
        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' },
            { name = 'cmdline' }
          })
        })
      end,
    }
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
