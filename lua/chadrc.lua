-- Этот файл должен иметь ту же структуру, что и nvconfig.lua
-- Документация и исходный файл можно найти по ссылке:
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

-- Настройки пользовательского интерфейса (UI)
M.ui = {
  theme = "decay",     -- Тема оформления для NvChad
  transparency = true, -- Включение прозрачности интерфейса

  telescope = {
    style = "bordered",
  },

  statusline = {
    theme = "devops", -- Кастомная DevOps-строка состояния (lua/nvchad/stl/devops.lua)
    order = {
      "mode",
      "file",
      "git",
      "%=",
      "lsp_msg",
      "%=",
      "diagnostics",
      "lsp",
      "kube",
      "cwd",
      "cursor",
    },
  },

  hl_override = {
    -- Переопределение стилей для элементов интерфейса
    Comment = { italic = true },      -- Комментарии будут отображаться курсивом
    ["@comment"] = { italic = true }, -- Комментарии Treesitter также будут курсивом

    -- Настройки цветов для изменений в диффах (Diff)
    DiffChange = {
      bg = "#464414", -- Фон для измененных строк в диффе
      fg = "none",    -- Цвет текста отключен
    },
    DiffAdd = {
      bg = "#103507", -- Фон для добавленных строк
      fg = "none",    -- Цвет текста отключен
    },
    DiffRemoved = {
      bg = "#461414", -- Фон для удаленных строк
      fg = "none",    -- Цвет текста отключен
    },

    -- Telescope: контрастные рамки и читаемые заголовки
    TelescopeBorder = { fg = "#6f8faf", bg = "none" },
    TelescopePromptBorder = { fg = "#88c0d0", bg = "none" },
    TelescopeResultsBorder = { fg = "#81a1c1", bg = "none" },
    TelescopePreviewBorder = { fg = "#8fbcbb", bg = "none" },
    TelescopePromptTitle = { fg = "#1b1f27", bg = "#88c0d0", bold = true },
    TelescopeResultsTitle = { fg = "#1b1f27", bg = "#81a1c1", bold = true },
    TelescopePreviewTitle = { fg = "#1b1f27", bg = "#8fbcbb", bold = true },

  },
}

return M
