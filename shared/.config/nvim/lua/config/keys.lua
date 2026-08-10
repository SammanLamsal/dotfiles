local opts = {noremap = true, silent = true}
local map = vim.keymap.set
map("n", "<leader>sd", vim.diagnostic.open_float, opts) -- show diagnostic
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open Diagnostic Location list' })
map("n", "<leader>of", function()
    local ft = vim.bo.filetype

    if ft == "html" then
        if vim.fn.has("mac") == 1 then
            vim.fn.jobstart({ "open", vim.fn.expand("%:p") }, { detach = true })
        elseif vim.fn.has("unix") == 1 then
            vim.fn.jobstart({ "xdg-open", vim.fn.expand("%:p") }, { detach = true })
        end

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

-- move highlighted lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in the middle when half page jumping
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- keep cursor in the middle when searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- keymap to delete to void register 
map("n", "<leader>d", "\"_d")
map("v", "<leader>d", "\"_d")

-- keymap to copy to system clipboard
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")
map("v", "<leader>Y", "\"+Y")

-- keymap to copy to system clipboard on delete
map("n", "<leader>d", "\"+d")
map("v", "<leader>d", "\"+d")
map("n", "<leader>D", "\"+D")
map("v", "<leader>D", "\"+D")

-- keymap to paste from system clipboard
map("n", "<leader>p", "\"+p")
map("v", "<leader>p", "\"+p")

-- find and replace all instances of word under cursor in current file
map("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
