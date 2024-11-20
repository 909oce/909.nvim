require("mini.base16").setup {
  palette = {
    base00 = "#101010", -- Background
    base01 = "#161616", -- Lighter background
    base02 = "#202020", -- Selection background
    base03 = "#635945", -- Comments
    base04 = "#80775d", -- Darker foreground
    base05 = "#aa9e7a", -- Default foreground
    base06 = "#d4be98", -- Lighter foreground
    base07 = "#d4be98", -- Lightest foreground
    base08 = "#fb4934", -- Red (errors, highlights)
    base09 = "#fe8019", -- Orange (warnings)
    base0A = "#fabd2f", -- Yellow
    base0B = "#b8bb26", -- Green (success)
    base0C = "#8ec07c", -- Cyan
    base0D = "#83a598", -- Blue (info)
    base0E = "#d3869b", -- Magenta
    base0F = "#d65d0e", -- Brown (special warnings)
  },
  use_cterm = true, -- This is optional; set it if you're using terminal Neovim
  plugins = { default = true },
}

local hl = vim.api.nvim_set_hl
local get = vim.api.nvim_get_hl_by_name

hl(0, "LineNr", { fg = get("LineNr", true).foreground, bg = "NONE" })
hl(0, "LineNrAbove", { fg = get("LineNrAbove", true).foreground, bg = "NONE" })
hl(0, "LineNrBelow", { fg = get("LineNrBelow", true).foreground, bg = "NONE" })
hl(0, "CursorLineNr", { fg = get("CursorLineNr", true).foreground, bg = "NONE" })
hl(0, "SignColumn", { bg = "NONE" })
hl(0, "CursorLine", { bg = "NONE" })
hl(0, "CursorLineSign", { bg = "NONE" })
hl(0, "MiniDiffOverAdd", { fg = get("MiniDiffOverAdd", true).foreground, bg = "NONE" })
hl(0, "MiniDiffOverChange", { fg = get("MiniDiffOverChange", true).foreground, bg = "NONE" })
hl(0, "MiniDiffOverDelete", { fg = get("MiniDiffOverDelete", true).foreground, bg = "NONE" })
hl(0, "MiniDiffSignAdd", { fg = get("MiniDiffSignAdd", true).foreground, bg = "NONE" })
hl(0, "MiniDiffSignChange", { fg = get("MiniDiffSignChange", true).foreground, bg = "NONE" })
hl(0, "MiniDiffSignDelete", { fg = get("MiniDiffSignDelete", true).foreground, bg = "NONE" })
hl(0, "WinSeparator", { fg = "#635945", bg = "NONE" })
hl(0, "MiniStatuslineDevinfo", { fg = get("MiniStatuslineDevinfo", true).foreground, bg = "#161616" })
hl(0, "TelescopeBorder", { fg = "#aa9e7a" })
hl(0, "TelescopePromptPrefix", { fg = "#d4be98" })
hl(0, "TelescopeMatching", { fg = "#b8bb26" })
hl(0, "IndentLine", { fg = "#161616" })
hl(0, "IndentLineCurrent", { fg = "#161616" })
hl(0, "MiniTablineCurrent", { fg = "#101010", bg = "#d4be98", bold = true })
hl(0, "MiniTablineModifiedVisible", { link = "MiniTablineVisible" })
hl(0, "MiniTablineModifiedHidden", { link = "MiniTablineHidden" })
hl(0, "MiniTablineModifiedCurrent", { link = "MiniTablineCurrent" })
hl(0, "MiniStatuslineModeNormal", { fg = "#101010", bg = "#d4be98", bold = true })
hl(0, "AlphaHeader", { link = "Normal" })
hl(0, "AlphaButton", { link = "Normal" })
