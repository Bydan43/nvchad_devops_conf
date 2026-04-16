local config = require "nvconfig"
local get_theme_tb = require("base46").get_theme_tb
local theme_type = get_theme_tb "type"
local colors = get_theme_tb "base_30"
local lighten = require("base46.colors").change_hex_lightness

local statusline_bg = config.base46.transparency and "NONE" or lighten(colors.statusline_bg, 1)
local light_grey = lighten(colors.light_grey, 8)

if theme_type == "light" then
  light_grey = lighten(colors.light_grey, -15)
end

local M = {
  StatusLine = { fg = light_grey, bg = statusline_bg },
  StText = { fg = light_grey, bg = statusline_bg },

  -- Git / context
  St_gitIcons = { fg = colors.blue, bg = statusline_bg, bold = true },
  St_cwd = { fg = colors.red, bg = colors.one_bg3 },

  -- LSP / diagnostics
  St_lspError = { fg = colors.red, bg = statusline_bg },
  St_lspWarning = { fg = colors.yellow, bg = statusline_bg },
  St_lspHints = { fg = colors.purple, bg = statusline_bg },
  St_lspInfo = { fg = colors.green, bg = statusline_bg },

  -- aliases used in some upstream modules
  St_LspHints = { fg = colors.purple, bg = statusline_bg },
  St_LspInfo = { fg = colors.green, bg = statusline_bg },

  St_Lsp = { fg = colors.green, bg = statusline_bg },
  St_LspMsg = { fg = colors.red, bg = statusline_bg },
}

local function gen_modes_hl(modename, col)
  M["St_" .. modename .. "mode"] = { fg = colors[col], bg = colors.one_bg3, bold = true }
  M["St_" .. modename .. "Mode"] = { fg = colors[col], bg = colors.one_bg3, bold = true }
end

gen_modes_hl("Normal", "blue")
gen_modes_hl("Visual", "cyan")
gen_modes_hl("Insert", "dark_purple")
gen_modes_hl("Terminal", "green")
gen_modes_hl("NTerminal", "yellow")
gen_modes_hl("Replace", "orange")
gen_modes_hl("Confirm", "teal")
gen_modes_hl("Command", "green")
gen_modes_hl("Select", "blue")

return M
