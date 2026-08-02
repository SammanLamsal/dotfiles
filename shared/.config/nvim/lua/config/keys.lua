local opts = {noremap = true, silent = true}
local map = vim.keymap.set
map("n", "<leader>sd", vim.diagnostic.open_float, opts) -- show diagnostic
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open Diagnostic Quickfix list' })
map("n", "<leader>of", function()
    local ft = vim.bo.filetype

    if ft == "html" then
        vim.fn.jobstart({ "xdg-open", vim.fn.expand("%:p") }, { detach = true })

    elseif ft == "markdown" then
        vim.cmd("MarkdownPreview")

    elseif ft == "typst" then
        vim.cmd("TypstPreview")

    elseif ft == "tex" then
        vim.cmd("VimtexCompile")
        vim.cmd("VimtexView")

    else
        vim.notify("No preview available for: " .. ft, vim.log.levels.WARN)
    end

end, { desc = "Open previw for current file" })
