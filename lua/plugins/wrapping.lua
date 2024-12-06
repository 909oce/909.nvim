return {
  {
    "andrewferrier/wrapping.nvim",
    event = "VeryLazy",
    config = function()
      require("wrapping").setup {
        softener = {
          text = true,
        },
      }
    end,
  },
}
