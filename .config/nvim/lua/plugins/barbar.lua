return {
  'romgrk/barbar.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
  },
  config = function()
    vim.g.barbar_auto_setup = false
    vim.o.showtabline = 0 -- Starts neovim with bars hidden

    function ToggleBarbar()
      local showtabline = vim.o.showtabline
      if showtabline == 2 then
        vim.o.showtabline = 0
      else
        vim.o.showtabline = 2
      end
    end

    vim.keymap.set('n', '<A-t>', ToggleBarbar, { noremap = true, silent = true })
  end,

  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    -- animation = true,
    -- insert_at_start = true,
    -- …etc.
  }
}
