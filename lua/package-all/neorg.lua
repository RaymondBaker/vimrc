return {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.summary"] = {},
          ["core.integrations.treesitter"] = {},
          ["core.integrations.nvim-cmp"] = {},
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp"
            }
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                work_notes = "~/neorg/work_notes", -- Format: <name_of_workspace> = <path_to_workspace_root>
                main_notes = "~/neorg/notes",
                ai_notes = "~/neorg/ai_notes",
                programming_notes = "~/neorg/programming_notes",
                book_notes = "~/neorg/book_notes",
                cooking_notes = "~/neorg/cooking_notes",
              },
              default_workspace = "ai_notes",
              index = "index.norg", -- The name of the main (root) .norg file
            }
          }
        }
      })
    end,
}
