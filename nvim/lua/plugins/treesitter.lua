
  return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = {"c", "cpp", "cmake", "lua", "javascript", "python", "markdown"},
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
