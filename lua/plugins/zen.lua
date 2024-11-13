return {
  {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim" },
    config = function()
      require("zen-mode").setup({
        window = {
          backdrop = 1,
          width = 200,
          height = 1,
        },
        plugins = {
          options = {
            laststatus = 0
          },
          twilight = {
            enabled = true
          }
        }
      })
      require("twilight").setup({
        dimming = {
          alpha = 0.25,
          color = { "Normal" },
          term_bg = "#101010",
          inactive = true,
        },
        context = 10,
        treesitter = true
      })
    end
  }
}
