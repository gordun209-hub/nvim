return {
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    dependencies = {
        "rafamadriz/friendly-snippets",
        "mikavilpas/blink-ripgrep.nvim",
    },

    version = "v0.*",
    opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        keymap = {
            preset = "default",
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-space>"] = {
                function(cmp)
                    cmp.show({ providers = { "snippets" } })
                end,
            },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<Tab>"] = {"accept"},
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
            kind_icons = {
                Text = "󰉿",
                Method = "󰊕",
                Function = "󰊕",
                Constructor = "󰒓",

                Field = "󰜢",
                Variable = "󰆦",
                Property = "󰖷",

                Class = "󱡠",
                Interface = "󱡠",
                Struct = "󱡠",
                Module = "󰅩",

                Unit = "󰪚",
                Value = "󰦨",
                Enum = "󰦨",
                EnumMember = "󰦨",

                Keyword = "󰻾",
                Constant = "󰏿",

                Snippet = "󱄽",
                Color = "󰏘",
                File = "󰈔",
                Reference = "󰬲",
                Folder = "󰉋",
                Event = "󱐋",
                Operator = "󰪚",
                TypeParameter = "󰬛",
            },
        },
        completion = {
            menu = {
                border = "single",
                -- highlight = 'VertSplit',
                draw = {
                    -- columns = { { 'item_idx' }, { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
                    -- components = {
                    --   item_idx = {
                    --     text = function(ctx) return ctx.idx == 10 and '0' or ctx.idx >= 10 and ' ' or tostring(ctx.idx) end,
                    --     highlight = 'Constant' -- optional, only if you want to change its color
                    --   }
                    -- }
                    columns = { { "kind_icon" }, { "label", gap = 1 } },
                    components = {
                        label = {},
                    },
                },
            },
            documentation = {
                window = {
                    border = "single",
                },
            },
        },
        signature = { window = { border = "single" } },
        cmdline = { enabled = true },
        sources = {
            per_filetype = {
                codecompanion = { "codecompanion" },
            },
            default = { "snippets", "lsp", "path", "buffer" },
            providers = {},
        },
    },
    opts_extend = {
        "sources.default",
        "sources.providers",
    },
}
