local opts = {noremap = true, silent = true}
local map = vim.keymap.set
map("n", "<leader>sd", vim.diagnostic.open_float, opts) -- show diagnostic
