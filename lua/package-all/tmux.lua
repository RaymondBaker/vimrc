return {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({
        copy_sync = {
          sync_clipboard = false
        },
        navigation = {
          -- enables default keybindings (C-hjkl) for normal mode
          enable_default_keybindings = false,
        },
        resize = {
          -- enables default keybindings (A-hjkl) for normal mode
          enable_default_keybindings = false,
        },
        swap = {
          -- enables default keybindings (C-A-hjkl) for normal mode
          enable_default_keybindings = false,
        }
      })
      -- Resize
      --
      local opts = { noremap=true, silent=true }

      vim.keymap.set({"n", "v", "i" }, '<M-Right>', '<cmd>lua require("tmux").resize_right()<cr>', opts)
      vim.keymap.set({"n", "v", "i" }, '<M-Left>', '<cmd>lua require("tmux").resize_left()<cr>', opts)
      vim.keymap.set({"n", "v", "i" }, '<M-Up>', '<cmd>lua require("tmux").resize_top()<cr>', opts)
      vim.keymap.set({"n", "v", "i" }, '<M-Down>', '<cmd>lua require("tmux").resize_bottom()<cr>', opts)
      -- Navigate
      vim.keymap.set({"n", "v", "i" }, '<M-l>', '<cmd>lua require("tmux").move_right()<cr>', opts)
      vim.keymap.set({"n", "v", "i" }, '<M-h>', '<cmd>lua require("tmux").move_left()<cr>', opts)
      vim.keymap.set({"n", "v", "i" }, '<M-k>', '<cmd>lua require("tmux").move_top()<cr>', opts)
      vim.keymap.set({"n", "v", "i" }, '<M-j>', '<cmd>lua require("tmux").move_bottom()<cr>', opts)
      -- Swap
      vim.keymap.set({"n", "v", "i" }, '<C-L>', '<cmd>lua require("tmux").swap_right()<cr>', opts)
      vim.keymap.set({"n", "v", "i" }, '<C-H>', '<cmd>lua require("tmux").swap_left()<cr>', opts)
      vim.keymap.set({"n", "v", "i" }, '<C-K>', '<cmd>lua require("tmux").swap_top()<cr>', opts)
      vim.keymap.set({"n", "v", "i" }, '<C-J>', '<cmd>lua require("tmux").swap_bottom()<cr>', opts)
    end,
}
