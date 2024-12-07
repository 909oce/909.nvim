return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    config = function()
      require("avante").setup {
        provider = "openai",
        windows = {
          sidebar_header = {
            rounded = false,
          },
          edit = {
            border = "single",
          },
          ask = {
            border = "single",
          },
        },
      }
    end,
  },
}
