return {
  "catppuccin/nvim", 
  lazy = false, 
  name = "catppuccin", 
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "catppuccin"

    vim.cmd[[ hi Normal guibg=NONE ctermbg=NONE ]]
    vim.cmd[[ hi SignColumn guibg=NONE ctermbg=NONE ]]
    vim.cmd[[ hi VertSplit guibg=NONE ctermbg=NONE ]]
    vim.cmd[[ hi StatusLine guibg=NONE ctermbg=NONE ]]
    vim.cmd[[ hi StatusLineNC guibg=NONE ctermbg=NONE ]]
    vim.cmd[[ hi NormalNC guibg=NONE ctermbg=NONE ]]
  end
}
