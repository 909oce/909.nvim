return {
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    config = function()
      require("cord").setup {
        log_level = "error",
        timestamp = {
          enabled = true,
          reset_on_idle = false,
          reset_on_change = false,
        },
        editor = {
          icon = nil,
          client = "neovim",
          tooltip = "",
        },
        display = {
          show_time = true,
          show_repository = true,
          show_cursor_position = false,
          swap_fields = false,
          swap_icons = true,
        },
        lsp = {
          show_problem_count = false,
          severity = 1,
          scope = "workspace",
        },
        idle = {
          enabled = true,
          show_status = true,
          timeout = 300000,
          ignore_focus = false,
          details = "Idle",
          tooltip = "💤",
        },
        buttons = {
          {
            label = "View Repository",
            url = function(opts)
              return opts.repo_url
            end,
          },
        },
        text = {
          workspace = "",
        },
        assets = {
          ranger = {
            name = "Ranger",
            tooltip = "ranger.nvim",
            type = "file_browser",
          },
        },
      }
    end,
  },
}
