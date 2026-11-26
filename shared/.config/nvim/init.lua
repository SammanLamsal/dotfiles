vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.opts")
require("config.lazy")
-- built-in undotree (:Undotree); must come after lazy resets the runtimepath
vim.cmd.packadd("nvim.undotree")
require("config.keys")
require("config.cmds")
