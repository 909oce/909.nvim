return {
  {
    "nvimdev/indentmini.nvim",
    event = "BufEnter",
    config = function()
      require("indentmini").setup {
        char = "▎",
      }
    end,
  },
}
