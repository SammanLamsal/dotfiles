vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.termguicolors = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.backspace = "indent,eol,start"

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 10

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

vim.opt.colorcolumn = "80"

-- vim.diagnostic.config({
--     virtual_text = true
-- })

-- transparent background
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight NormalNC guibg=none ctermbg=NONE")
vim.cmd("highlight NonText guibg=NONE ctermbg=NONE")
vim.cmd("highlight LineNr guibg=NONE ctermbg=NONE")
vim.cmd("highlight EndOfBuffer guibg=NONE ctermbg=NONE")

