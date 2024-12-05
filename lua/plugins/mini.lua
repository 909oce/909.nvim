return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require "colors.909"
      require("mini.statusline").setup {
        use_icons = true,
        set_vim_settings = true,
        content = {
          active = function()
            local MiniStatusline = require "mini.statusline"

            MiniStatusline.section_lsp = function(args)
              if MiniStatusline.is_truncated(args.trunc_width) then
                return ""
              end

              local buf_clients = vim.lsp.get_clients { bufnr = vim.api.nvim_get_current_buf() }
              if #buf_clients == 0 then
                return ""
              end

              local icon = args.icon or (MiniStatusline.config.use_icons and "󰰎" or "LSP")
              return icon
            end

            MiniStatusline.section_location = function()
              return "%2l:%-2v"
            end

            local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 0 }
            local lsp = MiniStatusline.section_lsp { trunc_width = 0 }
            local filename = MiniStatusline.section_filename { trunc_width = 75 }
            local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 100 }
            local location = MiniStatusline.section_location()
            local search = MiniStatusline.section_searchcount { trunc_width = 0 }

            return MiniStatusline.combine_groups {
              { hl = mode_hl, strings = { mode } },
              { hl = "MiniStatuslineDevinfo", strings = { lsp } },
              "%<", -- Mark general truncate point
              { hl = "MiniStatuslineFilename", strings = { filename } },
              "%=", -- End left alignment
              { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
              { hl = mode_hl, strings = { search, location } },
            }
          end,
        },
      }
      require("mini.git").setup()
      require("mini.diff").setup {
        view = {
          style = "number",
        },
      }
      require("mini.pairs").setup()
      require("mini.tabline").setup {
        format = function(buf_id, label)
          local suffix = vim.bo[buf_id].modified and "+ " or ""
          return require("mini.tabline").default_format(buf_id, label) .. suffix
        end,
      }
      require("mini.icons").setup()
      require("mini.icons").mock_nvim_web_devicons()
      require("mini.hipatterns").setup {
        highlighters = {
          hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
        },
      }
      require("mini.cursorword").setup()
      require("mini.surround").setup()
    end,
  },
}
