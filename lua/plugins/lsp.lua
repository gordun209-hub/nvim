return { {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    "hrsh7th/cmp-nvim-lsp",

    -- Useful status updates for LSP

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
  },


  config = function()
    local lspconfig = require('lspconfig')
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = false, -- lsp_lines
      update_in_insert = true,
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

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
    local on_attach = function(client, bufnr)
      client.server_capabilities.semanticTokensProvider = nil
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
      vim.keymap.set('n', '<leader>fa', function() vim.lsp.buf.format({ async = true }) end,
        { silent = true, desc = 'Format buffer' })
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    require('neodev').setup()
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
  end

},
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("go").setup {
        goimport = "gopls",
        lsp_cfg = {
          settings = {
            gopls = {},
          }
        },
        lsp_codelens = false,
        lsp_inlay_hints = {
          enable = false,
        },
        lsp_keymaps = function(bufnr)
          local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
          end
          local opts = { noremap = true, silent = true }

          buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
          buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
          buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
          buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
          buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
          buf_set_keymap("n", "<leader>rn", "<cmd>lua require('go.rename').lsprename()<CR>", opts)
        end,
        dap_debug = false,
      }
    end,
    ft = { "go", "gomod" },
    event = { "CmdlineEnter" },
    enabled = false,
    build = ':lua require("go.install").update_all_sync()',
  }
}
