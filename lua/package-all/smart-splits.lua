return {
  'mrjones2014/smart-splits.nvim',
  config = function()

    local vertical_amt = 3
    local horizontal_amt = 5
    local smart_splits = require('smart-splits')

    -- Doesn't ignore neo-tree when resizing
    --smart_splits.setup({
    --  ignored_buftypes = {
    --    'nofile',
    --    'quickfix',
    --    'prompt',
    --    'neo-tree',
    --  },
    --  ignored_filetypes = { 'NvimTree' },
    --})

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
        timer:start(1, 0, vim.schedule_wrap(function()
          debounce = false
        end))
      end
    end

    vim.keymap.set({"n", "v", "i", "t" }, '<A-Left>',  resize('left'))
    vim.keymap.set({"n", "v", "i", "t" }, '<A-Down>',  resize('down'))
    vim.keymap.set({"n", "v", "i", "t" }, '<A-Up>',    resize('up'))
    vim.keymap.set({"n", "v", "i", "t" }, '<A-Right>', resize('right'))
    -- moving between splits
    vim.keymap.set({"n", "v", "i", "t" }, '<A-h>', smart_splits.move_cursor_left)
    vim.keymap.set({"n", "v", "i", "t" }, '<A-j>', smart_splits.move_cursor_down)
    vim.keymap.set({"n", "v", "i", "t" }, '<A-k>', smart_splits.move_cursor_up)
    vim.keymap.set({"n", "v", "i", "t" }, '<A-l>', smart_splits.move_cursor_right)
    vim.keymap.set({"n", "v", "i", "t" }, '<A-\\>', smart_splits.move_cursor_previous)
    -- swapping buffers between windows
    vim.keymap.set({"n", "v"}, '<leader><leader>h', smart_splits.swap_buf_left)
    vim.keymap.set({"n", "v"}, '<leader><leader>j', smart_splits.swap_buf_down)
    vim.keymap.set({"n", "v"}, '<leader><leader>k', smart_splits.swap_buf_up)
    vim.keymap.set({"n", "v"}, '<leader><leader>l', smart_splits.swap_buf_right)
  end,
}
