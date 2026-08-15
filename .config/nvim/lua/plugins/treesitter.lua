return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",

        config = function()
            local treesitter = require("nvim-treesitter")

            treesitter.setup()

            treesitter.install({
                "c",
                "cpp",
                "cmake",
                "lua",
                "javascript",
                "python",
                "markdown",
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "c",
                    "cpp",
                    "cmake",
                    "lua",
                    "javascript",
                    "python",
                    "markdown",
                },
                callback = function(args)
                    vim.treesitter.start(args.buf)

                    vim.bo[args.buf].indentexpr =
                    "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
}

