return {
  "chipsenkbeil/org-roam.nvim",
  tag = "0.1.1",
  dependencies = {
    {
      "nvim-orgmode/orgmode",
      tag = "0.3.7",
    },
  },
  config = function()

    require('orgmode').setup({
      org_agenda_files = '~/org/**/*',
      org_default_notes_file = '~/org/refile.org',
    })

    require("org-roam").setup({
      directory = "~/org_roam_files",
      org_files = {
        "~/org/",
      }
    })
  end
}
