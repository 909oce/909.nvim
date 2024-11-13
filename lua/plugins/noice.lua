return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify"
    },
    config = function()
      require("notify").setup({
        on_open = function(win)
          if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_set_config(win, { border = {'┌','─', '┐', '│', '┘','─', '└', '│'} })
          end
        end,
        icons = {
          DEBUG = " ",
          ERROR = " ",
          INFO = " ",
          TRACE = "✎ ",
          WARN = " "
      },
        render = "wrapped-compact",
        stages = "static"
      })
      require("noice").setup({
        lsp = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        cmdline = {
          enabled = true,
          view = "cmdline",
          format = {
            conceal = false,
            cmdline = { icon = ">" },
            search_down = { icon = "/" },
            search_up = { icon = "?" },
          }
        },
      })
    end
  }
}
