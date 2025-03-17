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
          adapter = "granite_32",
        },
        inline = {
          adapter = "qwen25_coder", -- granite_code
        },
        agent = {
          adapter = "granite_32",
        },
      },
      adapters = {
        granite_code = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "granite_code", -- Give this adapter a different name to differentiate it from the default ollama adapter
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
        qwen25_coder = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "qwen25_coder", -- Give this adapter a different name to differentiate it from the default ollama adapter
            schema = {
              model = {
                default = "qwen2.5-coder",
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
        starcoder2 = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "starcoder2", -- Give this adapter a different name to differentiate it from the default ollama adapter
            schema = {
              model = {
                default = "starcoder2:7b",
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
            name = "granite_32", -- Give this adapter a different name to differentiate it from the default ollama adapter
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
