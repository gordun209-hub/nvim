local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == 'null-ls'
    end,
    bufnr = bufnr,
  })
end
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
    config = function()
      local lspconfig = require('lspconfig')
      vim.diagnostic.config({
        virtual_text = true,
        virtual_lines = true, -- lsp_lines
        underline = true,
        severity_sort = true,
        float = {
          focusable = false,
          style = 'minimal',
          border = 'rounded',
          header = '',
          prefix = '',
        },
      })
      -- diagnostic sign
      local signs = {
        Error = '',
        Warn = '',
        Hint = '',
        Info = '',
      }

      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
      vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })

      local on_attach = function(client, bufnr)
        -- avoid conflict on formatting with lsp and null-ls
        if client.supports_method('textDocument/formatting') then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              lsp_formatting(bufnr)
            end,
          })
        end
        client.server_capabilities.semanticTokensProvider = nil

        -- use telescope for lsp

        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { silent = true, desc = 'Show diagnostics' })
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { silent = true, desc = 'Show previous diagnostics' })
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { silent = true, desc = 'Show next diagnostics' })
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { silent = true, desc = 'Show loclist' })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { silent = true, desc = 'Goto declaration' })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { silent = true, desc = 'Goto definition' })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true, desc = 'Show docs' })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { silent = true, desc = 'Goto implementation' })
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { silent = true, desc = 'Show signature help' })
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { silent = true, desc = 'Show type definition' })
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { silent = true, desc = 'Rename symbol' })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { silent = true, desc = 'Code actions' })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { silent = true, desc = 'Show references' })
        -- use format function
        vim.keymap.set('n', '<leader>fa', lsp_formatting, { silent = true, desc = 'Format buffer' })
        --   vim.keymap.set('n', '<leader>fa', function()
        --     vim.lsp.buf.format({ async = true })
        --   end, { silent = true, desc = 'Format buffer' })
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
      require('neodev').setup()
      -- setup go
      lspconfig['gopls'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { 'gopls', 'serve' },
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      })

      lspconfig['lua_ls'].setup({
        capabilities = capabilities,
        on_attach = on_attach,

        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },

            diagnostics = {
              globals = { 'vim' },
            },

            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },

            runtime = { version = 'LuaJIT' },
          },
        },
      })
    end,
  },
  {
    'ray-x/go.nvim',
    dependencies = {
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('go').setup({
        goimport = 'gopls',
        lsp_cfg = {
          settings = {
            gopls = {},
          },
        },
        lsp_codelens = false,
        lsp_inlay_hints = {
          enable = true,
        },
        lsp_keymaps = function(bufnr)
          local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
          end
          local opts = { noremap = true, silent = true }
          local format_sync_grp = vim.api.nvim_create_augroup('GoFormat', {})
          vim.api.nvim_create_autocmd('BufWritePre', {
            pattern = '*.go',
            callback = function()
              require('go.format').gofmt()
            end,
            group = format_sync_grp,
          })
          buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
          buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
          buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
          buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
          buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
          buf_set_keymap('n', '<leader>rn', "<cmd>lua require('go.rename').lsprename()<CR>", opts)
          -- format with <leader>fa
          buf_set_keymap('n', '<leader>fa', "<cmd>lua require('go.format').gofmt()<CR>", opts)
        end,
        dap_debug = false,
      })
    end,
    ft = { 'go', 'gomod' },
    event = { 'CmdlineEnter' },
    build = ':lua require("go.install").update_all_sync()',
  },
  {
    'williamboman/mason.nvim',
    config = function()
      local mason = require('mason')

      mason.setup()
    end,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'VeryLazy',
    config = function()
      local null_ls = require('null-ls')
      -- require("custom_code_actions")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.gofumpt,
          null_ls.builtins.code_actions.shellcheck,
          null_ls.builtins.formatting.stylua,
          -- for python
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.diagnostics.hadolint,
        },
        debug = true,
      })
    end,
  },
}
