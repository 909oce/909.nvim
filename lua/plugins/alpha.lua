return {
  {
    "goolord/alpha-nvim",
    dependencies = {
      "MaximilianLloyd/ascii.nvim"
    },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'
      dashboard.section.header.val = require("ascii").get_random("text", "neovim")
      dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", ":ene<CR>"),
        dashboard.button("f", "󰈞  Find file", ":Ranger<CR>"),
        dashboard.button("r", "󰊄  Recently opened files", "<cmd>Telescope oldfiles<CR>"),
        dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
      }
      dashboard.section.header.opts.hl = "AlphaHeader"
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButton"
        button.opts.hl_shortcut = "AlphaButton"
      end
      alpha.setup(dashboard.config)
    end
  }
}
