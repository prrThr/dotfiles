return {
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- Carrega o tema imediatamente
    priority = 1000, -- Garante que o tema seja carregado antes dos outros plugins
    config = function()
        require("gruvbox").setup({
            terminal_colors = true,
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- Inverte as cores para buscas, diffs e statusline
            contrast = "", -- Pode ser "hard", "soft" ou vazio
            palette_overrides = {},
            overrides = {},
            dim_inactive = false,
            transparent_mode = true,
        })

        -- Define o esquema de cores
        vim.o.background = "dark" -- Use "light" se preferir o modo claro
        vim.cmd([[colorscheme gruvbox]])
    end
}

