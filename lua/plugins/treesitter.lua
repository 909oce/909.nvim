return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup {
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "python",
          "php",
          "javascript",
          "html",
          "css",
          "hyprlang",
          "markdown",
          "markdown_inline",
          "latex",
          "bash",
          "regex",
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        vim.filetype.add { pattern = { [".*/hypr/.*%.conf"] = "hyprlang" } },
      }
    end,
  },
}
