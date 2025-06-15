return {
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lua",
      "stevearc/conform.nvim",
      "LittleEndianRoot/mason-conform",
      "mfussenegger/nvim-lint",
      "rshkarin/mason-nvim-lint",
      "buschco/nvim-cmp-ts-tag-close",
      "onsails/lspkind.nvim",
    },

    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "checkhealth",
        callback = function()
          local win_id = vim.api.nvim_get_current_win()
          if vim.api.nvim_win_get_config(win_id).relative ~= "" then
            vim.api.nvim_win_set_config(win_id, {
              border = "single",
            })
          end
        end,
      })

      vim.lsp.config.lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      }
      vim.lsp.config.intelephense = {
        init_options = {
          globalStoragePath = os.getenv "HOME" .. "/.local/share/intelephense",
        },
      }

      require("mason").setup {
        ui = {
          border = "single",
          width = 0.8,
          height = 0.7,
          backdrop = 100,
        },
      }

      require("conform").setup {
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
        },
      }

      require("mason-conform").setup {
        ensure_installed = {
          "stylua",
        },
        automatic_installation = false,
      }

      vim.diagnostic.config {
        virtual_text = {
          prefix = function(diagnostic)
            local icons = {
              [vim.diagnostic.severity.ERROR] = " ",
              [vim.diagnostic.severity.WARN] = " ",
              [vim.diagnostic.severity.INFO] = " ",
              [vim.diagnostic.severity.HINT] = " ",
            }
            return icons[diagnostic.severity] or ""
          end,
        },
      }

      require("lint").linters_by_ft = {
        lua = { "luacheck" },
      }

      require("lint.linters.luacheck").args = {
        "--globals",
        "vim",
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })

      require("mason-nvim-lint").setup {
        ensure_installed = {
          "luacheck",
        },
        automatic_installation = false,
      }

      require("mason-lspconfig").setup {
        ensure_installed = {
          "lua_ls",
        },
      }

      require("nvim-cmp-ts-tag-close").setup {
        skip_tags = {
          "img",
        },
      }

      local cmp = require "cmp"
      cmp.setup {
        view = {
          entries = {
            name = "custom",
            selection_order = "near_cursor",
          },
        },
        window = {
          completion = {
            scrollbar = false,
          },
          documentation = {
            winhighlight = "Normal:CmpItemMenu",
          },
        },
        formatting = {
          format = require("lspkind").cmp_format {
            maxwidth = 20,
            ellipsis_char = "...",
          },
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-Enter>"] = cmp.mapping.confirm { select = true },
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<Down>"] = cmp.mapping(function(fallback)
            cmp.close()
            fallback()
          end, { "i" }),
          ["<Up>"] = cmp.mapping(function(fallback)
            cmp.close()
            fallback()
          end, { "i" }),
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "nvim_lua" },
          { name = "nvim-cmp-ts-tag-close" },
        },
      }
    end,
  },
}
