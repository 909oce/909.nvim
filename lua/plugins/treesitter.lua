return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "python",
          "php",
          "heex",
          "javascript",
          "html",
          "css",
          "hyprlang"
        },
        sync_install = true,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },
        indent = {
          enable = true,
        },
        vim.filetype.add({ pattern = { [".*/hypr/.*%.conf"] = "hyprlang" } })
      })
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          if not vim.b.treesitter_highlight then
            vim.cmd("TSBufEnable highlight")
            vim.b.treesitter_highlight = true
          end
        end
      })
    end,
  }
}
