local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
-- map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
-- map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
-- map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- telescope
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>bf", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", { desc = "telescope find files" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "telescope recent files" })
map("n", "<leader>fc", "<cmd>Telescope highlights<CR>", { desc = "telescope find highlights" })

-- Ranger
map("n", "<leader>ef", "<cmd>Ranger<CR>", { desc = "ranger" })

-- buffers
map("n", "<A-Tab>", ":bn<CR>", { desc = "next buffer" })
map("n", "<AS-Tab>", ":bp<CR>", { desc = "prev buffer" })

map("n", "<leader>bd", ":Bdelete<CR>", { desc = "delete buffer" })
map("n", "<leader>bp", ":bp<CR>", { desc = "previous buffer" })
map("n", "<leader>bn", ":bn<CR>", { desc = "next buffer" })
vim.cmd "command! Bd Bdelete"
vim.cmd "cnoreabbrev bd Bd"

-- Menus
map("n", "<leader>lm", ":Mason<CR>", { desc = "mason" })
map("n", "<leader>ll", ":Lazy<CR>", { desc = "lazy" })
map("n", "<leader>la", ":Alpha<CR>", { desc = "alpha" })
