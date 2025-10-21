return {
    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.ai").setup({})
            require("mini.surround").setup({})
            -- require("mini.pairs").setup({})
            require("mini.git").setup({})
            require("mini.diff").setup({})
            require("mini.statusline").setup({})
        end,
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile = {},
            indent = {},
            input = {},
            statuscolumn = {},
            quickfile = {},
            words = {},
            zen = {
                toggles = {
                    dim = false
                },
            },
            picker = {
                cycle = false,
                sources = {
                    files = { hidden = true }
                }
            },
            explorer = {
                replace_netrw = true,
                cycle = false,
                hidden = true,
                ignored = true,
            },
            git = {},
        },
        keys = {
            { "<leader>ee", function() Snacks.explorer() end,                                       desc = "Toggle File Explorer" },
            { "<leader>ff", function() Snacks.picker.smart() end,                                   desc = "Find Files (Snacks Picker)" },
            { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
            { "<leader>fg", function() Snacks.picker.grep() end,                                    desc = "Find Grepped Word" },
            { "<leader>fk", function() Snacks.picker.keymaps({ layout = "ivy" }) end,               desc = "Find Keymap" },
            { "<leader>fo", function() Snacks.picker.buffers() end,                                 desc = "Search Open Buffers" },
            { "<leader>uC", function() Snacks.picker.colorschemes({ layout = "ivy" }) end,          desc = "Find Colorschemes" },

            { "<leader>lg", function() Snacks.lazygit() end,                                        desc = "Lazygit" },
            { "<leader>gl", function() Snacks.lazygit.log() end,                                    desc = "Lazygit Logs" },
            { "<leader>gb", function() Snacks.git.blame_line() end,                                 desc = "Git Blame Current Line" },
            { "<leader>gd", function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },

            { "<leader>ld", function() Snacks.picker.diagnostics() end,                             desc = "List Diagnostics" },

            { "<leader>z",  function() Snacks.zen() end,                                            desc = "Toggle Zen Mode" },
            { "<leader>Z",  function() Snacks.zen.zoom() end,                                       desc = "Toggle Zoom" },
        }
    },
    {
        'nmac427/guess-indent.nvim',
        config = function() require('guess-indent').setup {} end,
    },
    {
        "sphamba/smear-cursor.nvim",
        opts = {},
    },
    {
        "mbbill/undotree"
    },

}
