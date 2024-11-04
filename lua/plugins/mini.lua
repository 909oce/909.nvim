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
      require ("mini.tabline").setup()
      require ("mini.icons").setup()
      require ("mini.hipatterns").setup({
        highlighters = {
          hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
        },
      })
      require ("mini.surround").setup()
      require ("mini.cursorword").setup()
    end,
  }
}
