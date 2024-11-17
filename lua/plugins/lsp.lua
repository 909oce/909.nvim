return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "stevearc/conform.nvim",
      "LittleEndianRoot/mason-conform",
    },
    config = function()
      require("mason").setup()
      require("conform").setup({
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      })
      require("mason-conform").setup({
        ensure_installed = {
          "black",
          "prettierd",
        }
      })
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require("mason-lspconfig").setup({
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
                    globals = { "vim" }
                  }
                }
              }
            }
          end,
          ["intelephense"] = function()
            require("lspconfig").intelephense.setup {
              capabilities = capabilities,
              init_options = {
                globalStoragePath = os.getenv('HOME') .. '/.local/share/intelephense'
              }
            }
          end
        }
      })
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-Enter>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = require("cmp").config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "cmdline" },
        })
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          {
            name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!' }
            }
          }
        })
      })
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
    end,
  }
}
