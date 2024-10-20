return {
    {
        "hrsh7th/cmp-nvim-lsp"
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        }
    },

    {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
        local cmp = require("cmp")
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            mapping = {

                ["<Enter>"] = function(fallback)
                    -- Don't block <CR> if signature help is active
                    -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/issues/13
                    if not cmp.visible() or not cmp.get_selected_entry() or cmp.get_selected_entry().source.name == 'nvim_lsp_signature_help' then
                        fallback()
                    else
                        cmp.confirm({
                            -- Replace word if completing in the middle of a word
                            -- https://github.com/hrsh7th/nvim-cmp/issues/664
                            behavior = cmp.ConfirmBehavior.Replace,
                            -- Don't select first item on CR if nothing was selected
                            select = false,
                        })
                    end
                end,

                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        local entries = cmp.get_entries()
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })

                        if #entries == 1 then
                            cmp.confirm()
                        end
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },
            sources = cmp.config.sources({
                {name = "nvim_lsp"},
                {name = "luasnip"},
                {name = "buffer"},
                {name = "path"},
            })
        })
    end,
}
}
