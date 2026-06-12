  return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install {"c", "lua", "vim", "vimdoc", "query", "python", "java", "markdown", "markdown_inline"}
    end
  }
