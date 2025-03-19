return {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                work_notes = "~/neorg/work_notes", -- Format: <name_of_workspace> = <path_to_workspace_root>
                misc_notes = "~/neorg/notes",
                ai_notes = "~/neorg/ai_notes",
                programming_notes = "~/neorg/programming_notes",
              },
              default_workspace = "work_notes",
              index = "index.norg", -- The name of the main (root) .norg file
            }
          }
        }
      })
    end,
}
