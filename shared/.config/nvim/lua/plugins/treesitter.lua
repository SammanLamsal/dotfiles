local parsers = {
    "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
    "c", "cpp", "python", "java", "go", "rust",
    "javascript", "typescript", "tsx", "html", "css", "json",
    "nix", "typst", "angular", "bash", "yaml", "toml",
    -- latex intentionally omitted: vimtex provides TeX syntax
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")
        local installed = ts.get_installed()
        local missing = vim.tbl_filter(function(p)
            return not vim.list_contains(installed, p)
        end, parsers)
        if #missing > 0 then
            ts.install(missing)
        end

        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
            callback = function(args)
                if args.match == "tex" then return end
                if pcall(vim.treesitter.start, args.buf) then
                    local lang = vim.treesitter.language.get_lang(args.match)
                    if lang and vim.treesitter.query.get(lang, "indents") then
                        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end
            end,
        })
    end,
}
