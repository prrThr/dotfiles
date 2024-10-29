return {
    {
        "hrsh7th/nvim-cmp",   -- Plugin principal de autocompletar
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- Fonte de LSP para autocompletar
            "hrsh7th/cmp-buffer", -- Fonte para completar palavras do buffer atual
            "hrsh7th/cmp-path", -- Fonte para completar caminhos de arquivos
            "hrsh7th/cmp-cmdline", -- Fonte para completar na linha de comando
            "hrsh7th/cmp-vsnip", -- Fonte para snippets (opcional)
            "hrsh7th/vim-vsnip" -- Suporte para snippets (opcional)
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body) -- Usar snippets com vsnip (opcional)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "cmdline" },
                }
            })
        end
    }
}
