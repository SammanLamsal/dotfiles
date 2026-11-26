return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            checkbox = {
                enabled = true,
                render_modes = false,
                right_pad = 1,
                unchecked = {
                    icon = "󰄱 ",
                    highlight = "RenderMarkdownUnchecked",
                },
                checked = {
                    icon = "󰱒 ",
                    highlight = "RenderMarkdownChecked",
                },
                custom = {
                    todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
                },
            },
        },
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
        lazy = false, -- VimTeX should not be lazy loaded
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            vim.g.vimtex_view_method = "sioyek"
        end,
    },
    {
        "chomosuke/typst-preview.nvim",
        ft = "typst",
        version = "1.*",
        opts = {
            dependencies_bin = {
                tinymist = "tinymist",
            },
        },
    },
}
