vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.buftype == "" then
      vim.cmd("lcd " .. vim.fn.expand("%:p:h"))
    end
  end,
})
