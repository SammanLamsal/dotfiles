vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function() vim.hl.on_yank() end,
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
--     desc = "Delete trailing whitespace on save",
--     group = vim.api.nvim_create_augroup("delete-whitespace", { clear = true }),
--     callback = function()
--         local save_cursor = vim.fn.getpos('.')
--         vim.cmd([[%s/\s\+$//e]])
--         vim.fn.setpos('.', save_cursor)
--     end,
-- })
