return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
          rust = { "rustfmt", lsp_format = "fallback" },
          javascript = { "prettierd", "prettier", stop_after_first = true },
        },
      })
    end,
  },

  {
    "kelly-lin/ranger.nvim",
    config = function()
      require("ranger-nvim").setup({
        replace_netrw = true,
        enable_cmds = false,
        ui = {
          border = "single",
          height = 0.75,
          width = 0.75,
          x = 0.5,
          y = 0.5,
        }
      })
      vim.api.nvim_set_keymap("n", "<leader>ef", "", {
        noremap = true,
        callback = function()
          require("ranger-nvim").open(true)
        end,
      })
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    },
    config = function()
      vim.g.lazygit_floating_window_border_chars = {'┌','─', '┐', '│', '┘','─', '└', '│'}
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
      require("telescope").setup({
        defaults = {
          borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
        }
      })
    end,
  },
  
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({global=false})
        end,
        desc = "buffer local keymaps"
      },
    },
  },

  {
     "goolord/alpha-nvim",
     config = function ()
         local alpha = require'alpha'
         local dashboard = require'alpha.themes.dashboard'
         dashboard.section.header.val = {
             [[                               __                ]],
             [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
             [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
             [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
             [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
             [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
         }
         dashboard.section.buttons.val = {
            dashboard.button( "e", "  New file" , ":ene<CR>"),
            dashboard.button( "SPC f f", "󰈞  Find file"),
            dashboard.button("SPC f r", "󰊄  Recently opened files"),
            dashboard.button( "q", "󰅚  Quit NVIM" , ":qa<CR>"),
         }
         alpha.setup(dashboard.config)
     end
  },

  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  --   config = function()
  --     require("ibl").setup()
  --   end,  
  -- },

  {
    "echasnovski/mini.nvim",
    config = function()
      require "colors.909"
      require ("mini.statusline").setup()
      require ("mini.statusline").section_location = function()
        return '%2l:%-2v'
      end
      require ("mini.git").setup()
      require ("mini.diff").setup({
        view = {
          style = 'number'
        }
      })
      require ("mini.pairs").setup()
      require ("mini.tabline").setup()
      require ("mini.icons").setup()
      require ("mini.hipatterns").setup({
        highlighters = {
          hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
        },
      })
    end,
  },
}
