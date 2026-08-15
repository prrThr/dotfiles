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
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

            -- Adding borders to floating windows ---------------------------------------------------------------------------
            -- Floating window border
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

            -- Hover
            vim.keymap.set("n", "K", function()
                vim.lsp.buf.hover({
                    border = border,
                })
            end)

            -- Signature help
            vim.keymap.set("i", "<C-k>", function()
                vim.lsp.buf.signature_help({
                    border = border,
                })
            end)

            -- Diagnostic popup
            vim.diagnostic.config({
                virtual_text = {
                    prefix = '■ ',
                },
                float = {
                    border = border,
                },
            }) 
            -- ----------------------------------------------------------------------------------------------------------------

            vim.lsp.config('lua_ls',{
                settings = {
                    Lua = {
                        diagnostics = {
                            -- Get the language server to recognize the 'vim' global
                            globals = { 'vim' }
                        }
                    }
                }
            })

            -- ----------------------------------------------------------------------------------------------------------------

            vim.lsp.config('pyright', {
                capabilities = capabilities,
                filetypes = { "python" },
                on_attach = function(client, bufnr)
                    client.config.settings.python.pythonPath = vim.g.python3_host_prog  -- ou o caminho específico do seu venv
                    client:notify("workspace/didChangeConfiguration") -- para atualizar a configuração
                    return true
                end
            })

            -- ----------------------------------------------------------------------------------------------------------------

            vim.lsp.config('clangd', {
                capabilities = capabilities,
            })

            vim.lsp.config('bashls', {
                capabilities = capabilities,
                filetypes = {"sh"}
            })

            -- ----------------------------------------------------------------------------------------------------------------

        end
    }
}
