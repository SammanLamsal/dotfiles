local map = vim.keymap.set

map("n", "<leader>sd", vim.diagnostic.open_float, { desc = "Show Diagnostic" })
map("n", "<leader>of", function()
    local ft = vim.bo.filetype
    if ft == "html" then
        local _, err = vim.ui.open(vim.fn.expand("%:p"))
        if err then vim.notify(err, vim.log.levels.ERROR) end
    elseif ft == "markdown" then
        vim.cmd("MarkdownPreview")
    elseif ft == "typst" then
        vim.cmd("TypstPreview")
    elseif ft == "tex" then
        vim.cmd("VimtexCompileSS")
    else
        vim.notify("No preview available for: " .. ft, vim.log.levels.WARN)
    end
end, { desc = "Open preview for current file" })

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- move highlighted lines
map("x", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
map("x", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })

-- keep cursor centered when half-page jumping and searching
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- system clipboard yank / delete / paste
map({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
map({ "n", "x" }, "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })
map({ "n", "x" }, "<leader>d", '"+d', { desc = "Delete to clipboard" })
map({ "n", "x" }, "<leader>D", '"+D', { desc = "Delete line to clipboard" })
map({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })

-- find and replace all instances of word under cursor in current file
map("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })
