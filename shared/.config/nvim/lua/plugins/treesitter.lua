  return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require 'nvim-treesitter'
      local parsers = {"c", "lua", "vim", "vimdoc", "query", "python", "java", "markdown", "markdown_inline"}
      for _, parser in ipairs(parsers) do
          ts.install(parser)
      end
    end
  }
