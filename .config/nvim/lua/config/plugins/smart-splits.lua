return {
    'mrjones2014/smart-splits.nvim',
    lazy = false,
    config = function ()
        -- recommended mappings
        -- resizing splits
        -- these keymaps will also accept a range,
        -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
        local keymap = vim.keymap
        local splits = require("smart-splits")
        keymap.set('n', '<A-h>', splits.resize_left)
        keymap.set('n', '<A-j>', splits.resize_down)
        keymap.set('n', '<A-k>', splits.resize_up)
        keymap.set('n', '<A-l>', splits.resize_right)
        -- moving between splits
        keymap.set('n', '<C-h>', splits.move_cursor_left)
        keymap.set('n', '<C-j>', splits.move_cursor_down)
        keymap.set('n', '<C-k>', splits.move_cursor_up)
        keymap.set('n', '<C-l>', splits.move_cursor_right)
        keymap.set('n', '<C-\\>', splits.move_cursor_previous)
        -- swapping buffers between windows
        keymap.set('n', '<leader><leader>h', splits.swap_buf_left)
        keymap.set('n', '<leader><leader>j', splits.swap_buf_down)
        keymap.set('n', '<leader><leader>k', splits.swap_buf_up)
        keymap.set('n', '<leader><leader>l', splits.swap_buf_right)
    end
}
