return {
  'mrjones2014/smart-splits.nvim',
  config = function()

    local vertical_amt = 5
    local horizontal_amt = 15
    local smart_splits = require('smart-splits')

    local function resize(dir)
      local debounce = false
      return function ()
        if debounce then
          return
        end

        if dir == 'left' then
          smart_splits.resize_left(horizontal_amt)
        elseif dir == 'right' then
          smart_splits.resize_right(horizontal_amt)
        elseif dir == 'up' then
          smart_splits.resize_up(vertical_amt)
        elseif dir == 'down' then
          smart_splits.resize_down(vertical_amt)
        else
          vim.notify(string.format('Resize func got undefined dir %s', dir), 'error')
        end

        debounce = true
        local timer = vim.uv.new_timer()
        timer:start(10, 0, vim.schedule_wrap(function()
          debounce = false
        end))
      end
    end

    vim.keymap.set({"n", "v", "i" }, '<A-Left>',  resize('left'))
    vim.keymap.set({"n", "v", "i" }, '<A-Down>',  resize('down'))
    vim.keymap.set({"n", "v", "i" }, '<A-Up>',    resize('up'))
    vim.keymap.set({"n", "v", "i" }, '<A-Right>', resize('right'))
    -- moving between splits
    vim.keymap.set({"n", "v", "i" }, '<A-h>', smart_splits.move_cursor_left)
    vim.keymap.set({"n", "v", "i" }, '<A-j>', smart_splits.move_cursor_down)
    vim.keymap.set({"n", "v", "i" }, '<A-k>', smart_splits.move_cursor_up)
    vim.keymap.set({"n", "v", "i" }, '<A-l>', smart_splits.move_cursor_right)
    vim.keymap.set({"n", "v", "i" }, '<A-\\>', smart_splits.move_cursor_previous)
    -- swapping buffers between windows
    vim.keymap.set({"n", "v"}, '<leader><leader>h', smart_splits.swap_buf_left)
    vim.keymap.set({"n", "v"}, '<leader><leader>j', smart_splits.swap_buf_down)
    vim.keymap.set({"n", "v"}, '<leader><leader>k', smart_splits.swap_buf_up)
    vim.keymap.set({"n", "v"}, '<leader><leader>l', smart_splits.swap_buf_right)
  end,
}
