return {
  { "vim-scripts/ebnf.vim" },
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
        "catppuccin-latte", "catppuccin-frappe", "catppuccin-macchiato", "catppuccin-mocha",
        {
          name = "Gruvbox dark",
          colorscheme = "gruvbox",
          before = [[
          vim.opt.background = "dark"
          ]],
        },
        {
          name = "Gruvbox light",
          colorscheme = "gruvbox",
          before = [[
          vim.opt.background = "light"
          ]],
          --after = [[-- Same as before, but after if you need it]]
        }},
      })
    end
  },
  { "ellisonleao/gruvbox.nvim" },
  { "catppuccin/nvim" }
}
