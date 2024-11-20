return {
  {
    "nvimdev/indentmini.nvim",
    config = function()
      require("indentmini").setup {
        char = "▎",
      }
    end,
  },
}
