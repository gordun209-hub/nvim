-- LSP Configuration & Plugins
return { {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },


  },
  config = function()
    local cmp_lsp = require('cmp_nvim_lsp')
    local capabilities = cmp_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local lspconfig = require('lspconfig')

    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)


    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = "single",
        title = "hover",
      }
    )

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
      }
    )

    lspconfig.pyright.setup {
      capabilities = capabilities,
    }

    lspconfig.emmet_ls.setup {
      capabilities = capabilities,
      filetypes = { "html" }
    }

    lspconfig.html.setup {
      capabilities = capabilities,
    }


    lspconfig.tsserver.setup {
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript.tsx",
        "typescript",
        "typescriptreact"
      },
      capabilities = capabilities
    }


    lspconfig.clangd.setup {
      capabilities = capabilities
    }

    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
            path = vim.split(package.path, ';')
          },
          diagnostics = {
            globals = {
              'vim',
              'describe',
              'it',
              'before_each',
              'after_each',
              'teardown',
              'pending',
              'clear',
            }
          },
          workspace = {
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
            }
          },
        }
      },
      capabilities = capabilities,
    }

    -- this came from the lsp-config github page
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<M-S-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>fa', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })
  end
},
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  }
}
