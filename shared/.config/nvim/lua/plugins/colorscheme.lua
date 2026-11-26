return {
    -- {
    --     "rebelot/kanagawa.nvim",
    --     config = function()
    --         vim.cmd.colorscheme("kanagawa-wave")
    --     end,
    -- },
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000,
    --     config = function()
    --         require("catppuccin").setup({})
    --         vim.cmd.colorscheme("catppuccin-mocha")
    --     end,
    -- },
    -- {
    --     "vague2k/vague.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("vague").setup({})
    --         vim.cmd("colorscheme vague")
    --     end,
    -- },
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000, -- load before all other start plugins
        opts = {
            background = "hard",
        },
        init = function()
            -- transparent background, reapplied on every colorscheme change
            vim.api.nvim_create_autocmd("ColorScheme", {
                group = vim.api.nvim_create_augroup("transparent-bg", { clear = true }),
                callback = function()
                    for _, group in ipairs({ "Normal", "NormalNC", "NonText", "LineNr", "EndOfBuffer" }) do
                        vim.api.nvim_set_hl(0, group, vim.tbl_extend("force",
                            vim.api.nvim_get_hl(0, { name = group, link = false }),
                            { bg = "NONE", ctermbg = "NONE" }))
                    end
                end,
            })
        end,
        config = function(_, opts)
            require("everforest").setup(opts)
            vim.cmd.colorscheme("everforest")
        end,
    },
}
