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
      "saadparwaiz1/cmp_luasnip",
      "j-hui/fidget.nvim",
    },

    config = function()
      require("fidget").setup()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "hyprls",
          "lua_ls",
          "cssls",
          "html",
          "intelephense",
        },
        handlers = {
          function (server_name)
            require("lspconfig")[server_name].setup {}
          end,
          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup {
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" }
                  }
                }
              }
            }
          end,
        }
      })
      local cmp = require("cmp")
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
          ["<C-Enter>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = require("cmp").config.sources({
          { name = "nvim_lsp" },
        }, {
          { name = "buffer" },
        })
      })
      vim.diagnostic.config({
        update_in_insert = true,
        float = {
          focusable = false,
          style = "minimal",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end,
  }
}
