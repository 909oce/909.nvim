return {
  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufEnter",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/nvim-cmp",
      "stevearc/conform.nvim",
      "LittleEndianRoot/mason-conform",
      -- "mfussenegger/nvim-lint",
      -- "rshkarin/mason-nvim-lint",
    },
    config = function()
      require("mason").setup()
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
          "black",
          "prettierd",
          "isort",
          "stylua",
        },
        automatic_installation = false,
      }
      vim.diagnostic.config {
        virtual_text = {
          prefix = "",
        },
      }
      -- require("lint").linters_by_ft = {
      --   lua = { "luac" },
      --   python = { "pylint" },
      -- }
      -- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      --   callback = function()
      --     require("lint").try_lint()
      --   end,
      -- })
      --
      -- require("mason-nvim-lint").setup {
      --   ensure_installed = {
      --     "luacheck",
      --   },
      --   automatic_installation = false,
      -- }
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
      local cmp = require "cmp"
      cmp.setup {
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
        sources = require("cmp").config.sources {
          { name = "nvim_lsp" },
          { name = "buffer" },
        },
      }
    end,
  },
}
