return {
  'mrjones2014/smart-splits.nvim',
  config = function()
    local smart_splits = require('smart-splits')
    vim.keymap.set({"n", "v", "i" }, '<A-Left>', smart_splits.resize_left)
    vim.keymap.set({"n", "v", "i" }, '<A-Down>', smart_splits.resize_down)
    vim.keymap.set({"n", "v", "i" }, '<A-Up>', smart_splits.resize_up)
    vim.keymap.set({"n", "v", "i" }, '<A-Right>', smart_splits.resize_right)
    -- moving between splits
    vim.keymap.set({"n", "v", "i" }, '<A-h>', require('smart-splits').move_cursor_left)
    vim.keymap.set({"n", "v", "i" }, '<A-j>', require('smart-splits').move_cursor_down)
    vim.keymap.set({"n", "v", "i" }, '<A-k>', require('smart-splits').move_cursor_up)
    vim.keymap.set({"n", "v", "i" }, '<A-l>', require('smart-splits').move_cursor_right)
    vim.keymap.set({"n", "v", "i" }, '<A-\\>', require('smart-splits').move_cursor_previous)
    -- swapping buffers between windows
    vim.keymap.set({"n", "v", "i" }, '<leader><leader>h', require('smart-splits').swap_buf_left)
    vim.keymap.set({"n", "v", "i" }, '<leader><leader>j', require('smart-splits').swap_buf_down)
    vim.keymap.set({"n", "v", "i" }, '<leader><leader>k', require('smart-splits').swap_buf_up)
    vim.keymap.set({"n", "v", "i" }, '<leader><leader>l', require('smart-splits').swap_buf_right)
  end,
}
