return {
    {
        -- "rebelot/kanagawa.nvim",
        -- -- config = function()
        -- vim.cmd.colorscheme("kanagawa-wave")
        -- end,
    },
    {
        -- "catppuccin/nvim",
        -- name = "catppuccin",
        -- priority = 1000,
        -- config = function()
        --     require("catppuccin").setup({})
        --     vim.cmd.colorscheme("catppuccin-mocha")
        -- end,
    },
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        opts = {
            background = "hard"
        },
        config = function()
            require("everforest").setup({})
            vim.cmd.colorscheme("everforest")
        end,
    },
    {
    --     "vague2k/vague.nvim",
    --     lazy = false,        -- make sure we load this during startup if it is your main colorscheme
    --     priority = 1000,     -- make sure to load this before all the other plugins
    --     config = function()
    --         require("vague").setup({})
    --         vim.cmd("colorscheme vague")
    --     end
    },

}
