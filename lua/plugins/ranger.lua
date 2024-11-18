return {
  {
    "909oce/ranger.nvim",
    config = function()
      require("ranger-nvim").setup({
        replace_netrw = true,
        enable_cmds = true,
        ui = {
          border = "single",
          height = 0.75,
          width = 0.75,
          x = 0.5,
          y = 0.5,
        }
      })
    end,
  }
}
