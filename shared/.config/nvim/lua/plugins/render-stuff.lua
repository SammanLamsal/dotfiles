return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},

        config = function()
            require('render-markdown').setup({
                checkbox = {
                    enabled = true,
                    render_modes = false,
                    right_pad = 1,
                    unchecked = {
                        icon = '󰄱 ',
                        highlight = 'RenderMarkdownUnchecked',
                        scope_highlight = nil,
                    },
                    checked = {
                        icon = '󰱒 ',
                        highlight = 'RenderMarkdownChecked',
                        scope_highlight = nil,
                    },
                    custom = {
                        todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
                    },
                },
            })
        end
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    {
        "lervag/vimtex",
        lazy = false, -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "sioyek"
        end
    },
    {
        'chomosuke/typst-preview.nvim',
        lazy = false, -- or ft = 'typst'
        version = '1.*',
        opts = {
            dependencies_bin = {
                tinymist = "tinymist"
            }
        },
    }
}
