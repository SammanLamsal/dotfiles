return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { "nvim-mini/mini.nvim" }, -- provides mini.icons
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    keys = {
        { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    -- lazy loading is not recommended by oil
    lazy = false,
}
