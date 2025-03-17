return {
  "olimorris/codecompanion.nvim",
  config = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = {
          adapter = "granite3.2",
        },
        inline = {
          adapter = "granite-code:8b",
        },
      },
      adapters = {
        granite_code = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "granite-code:8b", -- Give this adapter a different name to differentiate it from the default ollama adapter
            schema = {
              model = {
                default = "granite-code:8b",
              },
              num_ctx = {
                default = 16384,
              },
              num_predict = {
                default = -1,
              },
            },
          })
        end,
        granite_32 = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "granite3.2", -- Give this adapter a different name to differentiate it from the default ollama adapter
            schema = {
              model = {
                default = "granite3.2",
              },
              num_ctx = {
                default = 16384,
              },
              num_predict = {
                default = -1,
              },
            },
          })
        end,
      },
    })
  end
}
