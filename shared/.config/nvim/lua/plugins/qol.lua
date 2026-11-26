return {
    {
        "nvim-mini/mini.nvim",
        config = function()
            require("mini.icons").setup({})
            require("mini.ai").setup({})
            require("mini.surround").setup({})
            -- require("mini.pairs").setup({})
            require("mini.diff").setup({})
            require("mini.cmdline").setup({})
        end,
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            bigfile = {},
            indent = {},
            input = {},
            quickfile = {},
            words = {},
            zen = {
                toggles = {
                    dim = false,
                },
            },
            picker = {
                layout = { cycle = false },
                sources = {
                    files = { hidden = true },
                    explorer = {
                        hidden = true,
                        ignored = true,
                    },
                },
            },
            explorer = {
                replace_netrw = false, -- oil.nvim handles directory buffers
            },
        },
        keys = {
            { "<leader>ee", function() Snacks.explorer() end,                                       desc = "Toggle File Explorer" },
            { "<leader>ff", function() Snacks.picker.files() end,                                   desc = "Find Files (Snacks Picker)" },
            { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
            { "<leader>fg", function() Snacks.picker.grep() end,                                    desc = "Find by Grep" },
            { "<leader>fh", function() Snacks.picker.help() end,                                    desc = "Find Help" },
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
        },
    },
    {
        "nmac427/guess-indent.nvim",
        opts = {},
    },
    {
        "sphamba/smear-cursor.nvim",
        opts = {},
    },
}
