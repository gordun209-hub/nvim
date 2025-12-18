return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                -- Web development
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                -- Lua
                lua = { "stylua" },
                -- Go
                go = { "gofmt", "goimports" },
                c = { "clang-format" },
                -- Rust
                rust = { "rustfmt" },
                -- Shell
                sh = { "shfmt" },
                bash = { "shfmt" },
                zsh = { "shfmt" },
                -- TOML
                toml = { "taplo" },
                -- SICP
                racket = { "raco_fmt" },
                scheme = { "raco_fmt" },
                ["*"] = { "trim_whitespace" },
            },
            -- Set default options
            default_format_opts = {
                lsp_format = "fallback",
            },
            -- Set up format-on-save
            -- Customize formatters
            formatters = {
                raco_fmt = {
                    command = "raco",
                    args = { "fmt", "-i", "$FILENAME" },
                    stdin = false,
                },
                shfmt = {
                    prepend_args = { "-i", "2" }, -- 2 spaces indentation
                },
            },
        })

        -- Keybindings
        vim.keymap.set({ "n", "v" }, "<leader>fa", function()
            conform.format({
                lsp_format = "fallback",
                async = false,
                timeout_ms = 500,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
