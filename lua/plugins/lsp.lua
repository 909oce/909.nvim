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
      require("mason").setup {
        ui = {
          border = "single",
          width = 0.8,
          height = 0.7,
        },
      }

      require("conform").setup {
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      }

      require("mason-conform").setup {
        ensure_installed = {
          "prettierd",
        },
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
      }

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "hyprls",
          "lua_ls",
          "cssls",
          "html",
        },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup {
              capabilities = capabilities,
            }
          end,
          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup {
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                },
              },
            }
          end,
          ["intelephense"] = function()
            require("lspconfig").intelephense.setup {
              capabilities = capabilities,
              init_options = {
                globalStoragePath = os.getenv "HOME" .. "/.local/share/intelephense",
              },
            }
          end,
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
