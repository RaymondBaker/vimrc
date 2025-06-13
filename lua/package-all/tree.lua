return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "<leader>fe",  --"<cmd>NvimTreeToggle<CR>"
        function()
          require("nvim-tree.api").tree.toggle({ focus = true, find_file = true, })
        end,
        desc = "Explorer nvim-tree toggle"
      }
    },
    config = function()
      --respect_buf_cwd = false,
      --update_focused_file = {
      --    enable = true,
      --    update_root = true,
      --},
      require("nvim-tree").setup({
        disable_netrw       = true,
        hijack_netrw        = true,
        sync_root_with_cwd = true,
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 25,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
        actions = {
          change_dir = {
            enable = true,
            global = true,
            restrict_above_cwd = false,
          },
        }
      })
    end,
  },
  --{
  --  "nvim-neo-tree/neo-tree.nvim",
  --  cmd = "Neotree",
  --  keys = {
  --    {
  --      "<leader>fE",
  --      function()
  --        require("neo-tree.command").execute({ toggle = true, dir = require("config.util").get_root() })
  --      end,
  --      desc = "Explorer NeoTree (root dir)",
  --    },
  --    {
  --      "<leader>fe",
  --      function()
  --        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
  --      end,
  --      desc = "Explorer NeoTree (cwd)",
  --    },
  --    { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (root dir)", remap = true },
  --    { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
  --  },
  --  deactivate = function()
  --    vim.cmd([[Neotree close]])
  --  end,
  --  init = function()
  --    vim.g.neo_tree_remove_legacy_commands = 1
  --    if vim.fn.argc() == 1 then
  --      local stat = vim.loop.fs_stat(vim.fn.argv(0))
  --      if stat and stat.type == "directory" then
  --        require("neo-tree")
  --      end
  --    end
  --  end,
  --  opts = {
  --    filesystem = {
  --      bind_to_cwd = true,
  --      follow_current_file = {
  --        enabled = true,
  --      }
  --    },
  --    window = {
  --      mappings = {
  --        ["<space>"] = "none",
  --      },
  --    },
  --    default_component_configs = {
  --      indent = {
  --        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
  --        expander_collapsed = "",
  --        expander_expanded = "",
  --        expander_highlight = "NeoTreeExpander",
  --      },
  --    },
  --  },
  --},
}
