return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    -- Copied from LazyVim/lua/lazyvim/plugins/extras/dap/core.lua and
    -- modified.
    keys = {
      {
        "<leader>db",
        function() require("dap").toggle_breakpoint() end,
        desc = "Toggle Breakpoint"
      },

      {
        "<leader>dc",
        function() require("dap").continue() end,
        desc = "Continue"
      },

      {
        "<leader>dC",
        function() require("dap").run_to_cursor() end,
        desc = "Run to Cursor"
      },

      {
        "<leader>dT",
        function() require("dap").terminate() end,
        desc = "Terminate"
      },
    },
    config = function()
      vim.cmd("hi DapBreakpointColor guifg=#fa4848")
      vim.cmd("hi DapBreakpointConditionColor guifg=#ffff00")

      vim.fn.sign_define('DapBreakpoint', {text='', texthl='DapBreakpointColor', linehl='', numhl=''})
      vim.fn.sign_define('DapBreakpointCondition', {text='', texthl='DapBreakpointConditionColor', linehl='', numhl=''})
      vim.fn.sign_define('DapLogPoint', {text='', texthl='DapBreakpointConditionColor', linehl='', numhl=''})
      vim.fn.sign_define('DapBreakpointRejected', {text='󰰲', texthl='', linehl='', numhl=''})

      --DapBreakpoint for breakpoints (default: B)
      --DapBreakpointCondition for conditional breakpoints (default: C)
      --DapLogPoint for log points (default: L)
      --DapStopped to indicate where the debugee is stopped (default: →)
      --DapBreakpointRejected to indicate breakpoints rejected by the debug adapter (default: R)
    end,
  },
}
