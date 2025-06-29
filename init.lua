vim.deprecate = function() end

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

require("lazy").setup("plugins", {
  ui = {
    size = {
      width = 0.8,
      height = 0.7,
    },
    backdrop = 100,
    border = "single",
  },
})
require "options"
vim.schedule(function()
  require "mappings"
end)
