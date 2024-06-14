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
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the 'vim' global 
              globals = {'vim'}
            }
          }
        }
      })
      lspconfig.pyright.setup({})
      lspconfig.clangd.setup({})
      lspconfig.bashls.setup({})
    end
  }
}
