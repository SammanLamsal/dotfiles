return {
    {
        "mfussenegger/nvim-jdtls",
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                'saghen/blink.cmp',
            },
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            }
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            local servers = { "lua_ls", "pyright", "marksman", "clangd", "ts_ls", "gopls", "angularls", "jdtls", "html", "cssls", "jsonls", "eslint" }
            for _, server in ipairs(servers) do
                vim.lsp.config(server, {
                    capabilities = capabilities,
                })
                vim.lsp.enable(server)
            end
            -- format on save
            -- vim.api.nvim_create_autocmd('LspAttach', {
            --     callback = function(args)
            --         local client = vim.lsp.get_client_by_id(args.data.client_id)
            --         if not client then return end
            --         if client.supports_method('textDocument/formatting') then
            --             -- Format the current buffer on save
            --             vim.api.nvim_create_autocmd('BufWritePre', {
            --                 buffer = args.buf,
            --                 callback = function()
            --                     vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
            --                 end,
            --             })
            --         end
            --     end,
            -- })

            -- format keymap
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    vim.keymap.set("n", "<leader>mp", function()
                        vim.lsp.buf.format({ async = true })
                    end, { buffer = args.buf, noremap = true, silent = true })
                end,
            })
        end
    }
}
