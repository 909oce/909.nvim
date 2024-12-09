return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("notify").setup {
        on_open = function(win)
          if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_set_config(win, { border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" } })
          end
        end,
        icons = {
          DEBUG = " ",
          ERROR = " ",
          INFO = " ",
          TRACE = "✎ ",
          WARN = " ",
        },
        render = "wrapped-compact",
        stages = "static",
      }
      require("noice").setup {
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          hover = {
            silent = true,
          },
        },
        cmdline = {
          enabled = true,
          view = "cmdline_popup",
          format = {
            cmdline = false,
            search_down = false,
            search_up = false,
            filter = false,
            lua = false,
            help = false,
            input = false,
          },
        },
        messages = {
          view_search = false,
          view_history = "popup",
        },
        views = {
          popup = {
            border = {
              style = "single",
            },
          },
          cmdline_popup = {
            border = {
              style = "none",
              padding = { 1, 1 },
            },
            filter_options = {},
            win_options = {
              winhighlight = {
                Normal = "CommandLineNoice",
              },
            },
          },
          confirm = {
            position = {
              row = "50%",
              col = "50%",
            },
            border = {
              style = "single",
              padding = { 1, 1 },
            },
          },
        },
        routes = {
          {
            filter = {
              event = "msg_show",
              kind = "",
              find = "written",
            },
            opts = {
              skip = true,
            },
          },
          {
            view = "notify",
            filter = {
              event = "msg_showmode",
            },
          },
        },
        presets = {
          long_message_to_split = true,
        },
      }
    end,
  },
}
