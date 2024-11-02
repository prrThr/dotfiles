return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "clangd", "bashls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Adding borders to floating windows ---------------------------------------------------------------------------
      -- Specify how the border looks like
      local border = {
        { '┌', 'FloatBorder' },
        { '─', 'FloatBorder' },
        { '┐', 'FloatBorder' },
        { '│', 'FloatBorder' },
        { '┘', 'FloatBorder' },
        { '─', 'FloatBorder' },
        { '└', 'FloatBorder' },
        { '│', 'FloatBorder' },
      }

      -- Add the border on hover and on signature help popup window
      local handlers = {
        ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
        ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
      }

      -- Add border to the diagnostic popup window
      vim.diagnostic.config({
        virtual_text = {
          prefix = '■ ', -- Could be '●', '▎', 'x', '■', , 
        },
        float = { border = border },
      })
      -- ----------------------------------------------------------------------------------------------------------------

      lspconfig.lua_ls.setup({
        handlers = handlers,
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the 'vim' global
              globals = { 'vim' }
            }
          }
        }
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
        filetypes = { "python" },
        settings = {
          python = {
            pythonPath = "./venv/bin/python",
            venvPath = "./venv"
          }
        }
      })


      lspconfig.clangd.setup({})
      lspconfig.bashls.setup({})
    end
  }
}
