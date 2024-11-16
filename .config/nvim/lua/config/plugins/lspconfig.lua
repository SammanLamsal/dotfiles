return {
    {
        "neovim/nvim-lspconfig",

        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({capabilities = capabilities})
            lspconfig.pyright.setup({capabilities = capabilities})
            lspconfig.marksman.setup({capabilities = capabilities})
            lspconfig.clangd.setup({capabilities = capabilities})
        end,
    }
}
