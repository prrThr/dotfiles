return {
  'romgrk/barbar.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
  },
  config = function()
    vim.g.barbar_auto_setup = false

    -- Função para alternar a visibilidade da linha de abas
    function ToggleBarbar()
      local showtabline = vim.o.showtabline
      if showtabline == 2 then
        vim.o.showtabline = 0
      else
        vim.o.showtabline = 2
      end
    end

    -- Mapeando a combinação de teclas Alt+T para alternar a linha de abas
    vim.keymap.set('n', '<A-t>', ToggleBarbar, { noremap = true, silent = true })
  end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    -- animation = true,
    -- insert_at_start = true,
    -- …etc.
  }
}
