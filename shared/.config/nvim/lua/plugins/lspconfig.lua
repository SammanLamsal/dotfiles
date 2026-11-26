return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            -- completion capabilities are added globally by blink.cmp (vim.lsp.config("*"))
            vim.lsp.enable({
                "lua_ls",
                "pyright",
                "marksman",
                "clangd",
                "ts_ls",
                "gopls",
                "angularls",
                "jdtls",
                "html",
                "cssls",
                "jsonls",
                "eslint",
                "tailwindcss",
                "nixd",
                "tinymist", -- typst lsp
                "texlab",
                "rust_analyzer",
            })

            -- format on save
            -- vim.api.nvim_create_autocmd("LspAttach", {
            --     group = vim.api.nvim_create_augroup("lsp-format-on-save", { clear = true }),
            --     callback = function(args)
            --         local client = vim.lsp.get_client_by_id(args.data.client_id)
            --         if not client then return end
            --         if client:supports_method("textDocument/formatting") then
            --             vim.api.nvim_create_autocmd("BufWritePre", {
            --                 buffer = args.buf,
            --                 callback = function()
            --                     vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
            --                 end,
            --             })
            --         end
            --     end,
            -- })

            -- format keymap
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp-keymaps", { clear = true }),
                callback = function(args)
                    vim.keymap.set("n", "<leader>mp", function()
                        vim.lsp.buf.format({ async = true })
                    end, { buffer = args.buf, silent = true, desc = "Format buffer" })
                end,
            })
        end,
    },
}
