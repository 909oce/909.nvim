local opt = vim.opt
local o = vim.o

opt.laststatus = 3
o.showmode = false
o.scrolloff = 10
o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"
o.cmdheight = 0

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.wrap = false;

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2

-- disable nvim intro
opt.shortmess:append "sI"

o.signcolumn = "no"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true
o.list = false

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"
