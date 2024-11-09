return {
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
      require ("mini.tabline").setup({
        format = function(buf_id, label)
          local suffix = vim.bo[buf_id].modified and '+ ' or ''
          return require('mini.tabline').default_format(buf_id, label) .. suffix
        end,
      })
      require ("mini.icons").setup()
      require ("mini.hipatterns").setup({
        highlighters = {
          hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
        },
      })
      require ("mini.cursorword").setup()
    end,
  }
}
